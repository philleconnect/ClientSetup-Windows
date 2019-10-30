import pywinauto

pywinauto.Application().start(r'mmc gpedit.msc')
app = pywinauto.Application(backend="uia").connect(path='mmc.exe')

admin_template = app.EditorFuerLokaleGruppenrichtlinien.child_window(title="Benutzerkonfiguration", control_type="TreeItem").child_window(title="Windows-Einstellungen", control_type="TreeItem")
admin_template.double_click_input()

start_menu = admin_template.child_window(title="Skripts (Anmelden/Abmelden)", control_type="TreeItem")
start_menu.double_click_input()

option_list = app.EditorFuerLokaleGruppenrichtlinien.child_window(auto_id="12786", control_type="List")

option = option_list.child_window(title="Anmelden", control_type="ListItem")
option.double_click_input()

app.EigenschaftenVonAnmelden.child_window(title="Hinzufügen...", auto_id="106", control_type="Button").click()

pywinauto.keyboard.send_keys("C:\\Program Files\\PhilleConnect\\pclogin.bat", with_spaces=True)

app.EigenschaftenVonAnmelden.HinzufuegenEinesSkripts.child_window(title="OK", auto_id="1", control_type="Button").click()

app.EigenschaftenVonAnmelden.child_window(title="Übernehmen", auto_id="12321", control_type="Button").click()
app.EigenschaftenVonAnmelden.child_window(title="OK", auto_id="1", control_type="Button").click()

app.kill()
