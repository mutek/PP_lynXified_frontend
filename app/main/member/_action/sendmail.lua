local member = Member:by_id(param.get_id())
local member_id_me = app.session.member_id
if member_id_me then
member_me = Member:by_id(member_id_me)
trace.disable()
local content = slot.use_temporary(function()
  slot.put(_"Hello " .. member.name .. ".\n\n")
  slot.put(_("#{name} sent you a message", { name = member_me.name }))
  slot.put(":\n------------------------------------------------------------\n\n")
  -- slot.put(member_me.name .." ".. _"sent you a message" .. ":\n------------------------------------------\n\n")
  slot.put(param.get("text"))
  slot.put("\n\n------------------------------------------------------------\n")
  slot.put(_("Reply by going to #{url}", { url = request.get_absolute_baseurl() .. "member/show/" .. member_me.id .. ".html" }))
end)
local success = net.send_mail{
  envelope_from = config.mail_envelope_from,
  from          = config.mail_from,
  reply_to      = config.mail_reply_to,
  to            = member.notify_email,
  subject       = config.mail_subject_prefix .. _("Message from #{name}", { name = member_me.name }),
  content_type  = "text/plain; charset=UTF-8",
  content       = content
}
if success then
  slot.put_into("notice", _"Your message has been sent")
  return
end
end
slot.put_into("error", _"Your message has not been sent")
