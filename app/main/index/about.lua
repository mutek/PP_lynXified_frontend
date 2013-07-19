ui.title(_"About site")

if app.session.member_id and config.use_terms then
  ui.actions(function()
    ui.link{
      module = "index",
      view = "usage_terms",
      text = _"Terms of use"
    }
  end)
end


slot.put("<br />")
ui.field.text{ attr = { style = "font-weight: bold;" }, value = _"This service is provided by:" }
slot.put("<br />")

slot.put(config.app_service_provider)

slot.put("<br />")
slot.put("<br />")
slot.put("<br />")


ui.field.text{ attr = { style = "font-weight: bold;" }, value = _('More information can be found at: ') }
slot.put('<br/><a href="http://lynXified.feedback.pages.de">lynXified feedback</a>')
slot.put("<br />")

slot.put("<br />")
slot.put("<br />")
slot.put("<br />")

ui.field.text{ attr = { style = "font-weight: bold;" }, value = "3rd party license information:" }
slot.put("<br />")
slot.put('The icons used in lynXified feedback (except national flags and university logos) are from <a href="http://www.famfamfam.com/lab/icons/silk/">Silk icon set 1.3</a> by Mark James. His work is licensed under a <a href="http://creativecommons.org/licenses/by/2.5/">Creative Commons Attribution 2.5 License.</a>')

