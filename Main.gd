extends Control

var willQuit: bool = true
var path: String = ""
var HollowKnightRefs: String = ""
var dir: Directory

var ErrorMessages: Array = [
	"",
	"Missing Mod Name",
	"Missing Assembly Name"
]

onready var modNameNode = $ModCreation/HBoxContainer/VBoxContainer/ModName
onready var assemblyNameNode = $ModCreation/HBoxContainer/VBoxContainer/AssemblyName
onready var descriptionNode = $ModCreation/HBoxContainer/VBoxContainer/Description
onready var saveGlobalsNode = $ModCreation/HBoxContainer/VBoxContainer/SaveGlobals

func _ready() -> void:
	var file: File = File.new()
	if file.file_exists("user://HKModMakerSavePath.save"):
		file.open("user://HKModMakerSavePath.save", File.READ)
		path = file.get_line()
		file.close()
	if file.file_exists("user://HollowKnightRefs.save"):
		file.open("user://HollowKnightRefs.save", File.READ)
		HollowKnightRefs = file.get_line()
		file.close()

	if path == "" or HollowKnightRefs == "":
		$Menu/VBoxContainer/CreateMod.disabled = true
	else:
		dir = Directory.new()
		dir.open(path)



func createMod(modName: String, assemblyName: String, description: String, dependencies: Array, saveSettings: bool) -> void:
	var dependenciesString: String = ""
	var usingMods: String = ""
	for dependency in dependencies:
		dependenciesString += Storage.generateDependency(dependency)
		usingMods += Storage.getUsingKeys(dependency)

	var classExtension: String = " : Mod"
	var modSaveSettings: String = ""
	if saveSettings:
		classExtension = " : SaveSettingsMod<ModSaveSettings.ModSaveSettings>"
		modSaveSettings = "\nusing " + assemblyName + ".ModSaveSettings;"

	var file: File = File.new()
	dir.make_dir_recursive(assemblyName + "/Resources")
	dir.open(assemblyName)
	var curDir: String = dir.get_current_dir() + "/" + assemblyName + "/"

	file.open(curDir + "ProjectFile.csproj", File.WRITE)
	file.store_string(
		Storage.ProjectFile\
		.replace("^^Name^^", modName)\
		.replace("^^Description^^", description)\
		.replace("^^AssemblyName^^", assemblyName)\
		.replace("^^Dependencies^^", dependenciesString)\
		.replace("^^HollowKnightRefs^^", HollowKnightRefs)
	)
	file.close()

	file.open(curDir + "ReadMe.md", File.WRITE)
	file.store_string(
		Storage.ReadMe\
		.replace("^^Name^^", modName)\
		.replace("^^Description^^", description)
	)
	file.close()

	file.open(curDir + "Makefile", File.WRITE)
	file.store_string(Storage.Makefile)
	file.close()

	file.open(curDir + "ModSaveSettings.cs", File.WRITE)
	file.store_string(
		Storage.ModSaveSettings\
		.replace("^^AssemblyName^^", assemblyName)
	)
	file.close()

	file.open(curDir + assemblyName + ".cs", File.WRITE)
	file.store_string(
		Storage.BaseMod\
		.replace("^^AssemblyName^^", assemblyName)\
		.replace("^^Name^^", modName)\
		.replace("^^ClassExtension^^", classExtension)\
		.replace("^^ModSaveSettings^^", modSaveSettings)\
		.replace("^^UsingMods^^", usingMods)\
	)
	file.close()

func _on_FileDialog_popup_hide() -> void:
	if willQuit:
		get_tree().quit()


func _on_FileDialog_dir_selected(directoryPath) -> void:
	var file: File = File.new()
	file.open("user://HKModMakerSavePath.save", File.WRITE)
	file.store_string(directoryPath)
	file.close()

	get_tree().reload_current_scene()



# Autofill Stuff
var assemblyNameChanged: bool = false

func _on_ModName_text_changed(new_text: String) -> void:
	if not assemblyNameChanged:
		$ModCreation/HBoxContainer/VBoxContainer/AssemblyName.text = new_text.replacen(" ", "")


func _on_AssemblyName_text_changed(_new_text: String) -> void:
	assemblyNameChanged = true


func _on_SetEditingFolder_pressed() -> void:
	$FileDialog.popup()
	$FileDialog.rect_position.y = 0


func _on_Exit_pressed() -> void:
	get_tree().quit()


func _on_CreateMod_pressed() -> void:
	$Menu.hide()
	$ModCreation.show()

func _on_GenerateMod_pressed() -> void:
	var error: int = canGenerateMod()
	if error == 0:
		$ModCreation.hide()
		var dependencies: Array = []
		for node in $ModCreation/HBoxContainer/Dependencies.get_children():
			if node is CheckBox:
				if node.pressed:
					dependencies.append(node.name)

		createMod(modNameNode.text, assemblyNameNode.text, descriptionNode.text, dependencies, saveGlobalsNode.pressed)

		$Exported.popup_centered()
	else:
		$GenerationError.dialog_text = ErrorMessages[error]
		$GenerationError.popup_centered()

func canGenerateMod() -> int:
	if modNameNode.text == "":
		return 1

	if assemblyNameNode.text == "":
		return 2

	return 0


func _on_HKModPath_pressed() -> void:
	$ModPathDialog.popup()
	$ModPathDialog.rect_position.y = 0


func _on_ModPathDialog_dir_selected(directoryPath: String) -> void:
	var file: File = File.new()
	file.open("user://HollowKnightRefs.save", File.WRITE)
	file.store_string(directoryPath)
	file.close()

	get_tree().reload_current_scene()


func _on_Exported_popup_hide() -> void:
	$Menu.show()
