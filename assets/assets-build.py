#!/usr/bin/env python3
import json
import os
import time
from watchdog.observers import Observer
from watchdog.events import PatternMatchingEventHandler
import code
import yaml



def buildStringsAssetsConstants():
    # Remove strings.dart file
    if os.path.exists("lib/app/core/constants/strings_assets_constants.dart"):
        os.remove("lib/app/core/constants/strings_assets_constants.dart")
    # create new strings.dart file
    newFile = open("lib/app/core/constants/strings_assets_constants.dart", "a+")
    # open connection with the english json file
    english_strings_file = open("assets/translations/en.json", "r")

    # start writing imports and class name
    newFile.write("import 'package:get/get.dart';" + "\n")
    newFile.write("class StringsAssetsConstants {" + "\n")
    # read json data
    jsonData = json.load(english_strings_file)

    # parsing
    for key in jsonData:
        varName = ""
        varNameList = key.split(" ")
        for idx, val in enumerate(varNameList):
            varName += val.lower() if idx == 0 else val.capitalize()

        if "%s" in jsonData[key]:
            print("build functions")
            newFile.write("static String "+varName + "(List<String> items){"+"\n"+
                          "String str = \""+key+"\".tr;"+"\n"+
                          "items.forEach((element) { str.replaceFirst(\"%s\", element);});"+"\n"+
                          "return str;}"+"\n")
        else:
            # writing variables
            newFile.write("static String get "+varName +
                          "{return \""+key+"\".tr;}"+"\n")

    newFile.write("}")
    # close connections
    newFile.close()
    english_strings_file.close()

def buildImagesAssetsConstants():
     # Remove strings.dart file
    if os.path.exists("lib/app/core/constants/images_assets_constants.dart"):
        os.remove("lib/app/core/constants/images_assets_constants.dart")
    # create new strings.dart file
    newFile = open("lib/app/core/constants/images_assets_constants.dart", "a+")

    # start writing imports and class name

    newFile.write("class ImagesAssetsConstants {" + "\n")
    # iterating all sub directories
    foldersNames = os.listdir("assets/images")

    fileNames = set([])

    for folderName in foldersNames:
        if folderName != ".DS_Store":
            for fileName in os.listdir("assets/images/"):
                fileNames.add(fileName)

    for item in fileNames:
        if item != ".DS_Store":
            varName = ""
            varNameList = item.split("_")
            for idx, val in enumerate(varNameList):
                varName += val if idx == 0 else val.capitalize()

            # writing variables
            stringToWrite = "static const String "+varName.split(".")[0]+" = \"assets/images/"+item+"\";"+"\n"
            newFile.write(stringToWrite)
    
    newFile.write("}")
    # close connections
    newFile.close()

def buildIconsAssetsConstants():
    # Remove strings.dart file
    if os.path.exists("lib/app/core/constants/icons_assets_constants.dart"):
        os.remove("lib/app/core/constants/icons_assets_constants.dart")
    # create new strings.dart file
    newFile = open("lib/app/core/constants/icons_assets_constants.dart", "a+")

    # start writing imports and class name

    newFile.write("class IconsAssetsConstants {" + "\n")
    # iterating all sub directories
    foldersNames = os.listdir("assets/icons")

    fileNames = set([])

    for folderName in foldersNames:
        if folderName != ".DS_Store":
            for fileName in os.listdir("assets/icons/"):
                fileNames.add(fileName)

    for item in fileNames:
        if item != ".DS_Store":
            varName = ""
            varNameList = item.split("_")
            for idx, val in enumerate(varNameList):
                varName += val if idx == 0 else val.capitalize()

            # writing variables
            stringToWrite = "static const String "+varName.split(".")[0]+" = \"assets/icons/"+item+"\";"+"\n"
            newFile.write(stringToWrite)
    
    newFile.write("}")
    # close connections
    newFile.close()
    
def buildAnimationsAssetsConstants():
    # Remove strings.dart file
    if os.path.exists("lib/app/core/constants/animations_assets_constants.dart"):
        os.remove("lib/app/core/constants/animations_assets_constants.dart")
    # create new strings.dart file
    newFile = open("lib/app/core/constants/animations_assets_constants.dart", "a+")

    # start writing imports and class name

    newFile.write("class AnimationsAssetsConstants {" + "\n")
    # iterating all sub directories
    foldersNames = os.listdir("assets/animations")

    fileNames = set([])

    for folderName in foldersNames:
        if folderName != ".DS_Store":
            for fileName in os.listdir("assets/animations/"):
                fileNames.add(fileName)

    for item in fileNames:
        if item != ".DS_Store":
            varName = ""
            varNameList = item.split("_")
            for idx, val in enumerate(varNameList):
                varName += val if idx == 0 else val.capitalize()

            # writing variables
            stringToWrite = "static const String "+varName.split(".")[0]+" = \"assets/animations/"+item+"\";"+"\n"
            newFile.write(stringToWrite)
    
    newFile.write("}")
    # close connections
    newFile.close()
    
def buildLogosAssetsConstants():
    # Remove strings.dart file
    if os.path.exists("lib/app/core/constants/logos_assets_constants.dart"):
        os.remove("lib/app/core/constants/logos_assets_constants.dart")
    # create new strings.dart file
    newFile = open("lib/app/core/constants/logos_assets_constants.dart", "a+")

    # start writing imports and class name

    newFile.write("class LogosAssetsConstants {" + "\n")
    # iterating all sub directories
    foldersNames = os.listdir("assets/logos")

    fileNames = set([])

    for folderName in foldersNames:
        if folderName != ".DS_Store":
            for fileName in os.listdir("assets/logos/"):
                fileNames.add(fileName)

    for item in fileNames:
        if item != ".DS_Store":
            varName = ""
            varNameList = item.split("_")
            for idx, val in enumerate(varNameList):
                varName += val if idx == 0 else val.capitalize()

            # writing variables
            stringToWrite = "static const String "+varName.split(".")[0]+" = \"assets/logos/"+item+"\";"+"\n"
            newFile.write(stringToWrite)
    
    newFile.write("}")
    # close connections
    newFile.close()



def buildAudiosAssetsConstants():
    # Remove strings.dart file
    if os.path.exists("lib/app/core/constants/audios_assets_constants.dart"):
        os.remove("lib/app/core/constants/audios_assets_constants.dart")
    # create new strings.dart file
    newFile = open("lib/app/core/constants/audios_assets_constants.dart", "a+")

    # start writing imports and class name

    newFile.write("class AudiosAssetsConstants {" + "\n")
    # iterating all sub directories
    foldersNames = os.listdir("assets/audios")

    fileNames = set([])

    for folderName in foldersNames:
        if folderName != ".DS_Store":
            for fileName in os.listdir("assets/audios/"):
                fileNames.add(fileName)

    for item in fileNames:
        if item != ".DS_Store":
            varName = ""
            varNameList = item.split("_")
            for idx, val in enumerate(varNameList):
                varName += val if idx == 0 else val.capitalize()

            # writing variables
            stringToWrite = "static const String "+varName.split(".")[0]+" = \"assets/audios/"+item+"\";"+"\n"
            newFile.write(stringToWrite)

    newFile.write("}")
    # close connections
    newFile.close()

def runScripts(data):
    print("recreating assets ...")
    
    buildStringsAssetsConstants()
    buildImagesAssetsConstants()
    buildIconsAssetsConstants()
    buildAnimationsAssetsConstants()
    buildLogosAssetsConstants()
    buildAudiosAssetsConstants()

print("assets created")

def main():
    patterns = "*"
    ignore_patterns = ""
    ignore_directories = False
    case_sensitive = True
    runScripts("")
    my_event_handler = PatternMatchingEventHandler(patterns, ignore_patterns, ignore_directories, case_sensitive)
    my_event_handler.on_created = runScripts
    my_event_handler.on_deleted = runScripts
    my_event_handler.on_modified = runScripts
    path = "./assets"
    go_recursively = True
    my_observer = Observer()
    my_observer.schedule(my_event_handler, path, recursive=go_recursively)
    my_observer.start()

    code.interact()
    try:
        while True:
            time.sleep(1)
    except KeyboardInterrupt:
        my_observer.stop()
        my_observer.join()

if __name__== "__main__":
    main()