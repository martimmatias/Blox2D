local MyPath = "Blox2D.Classes."
Instance = require(MyPath.."instance")
--[[require(MyPath.."serviceprovider")
require(MyPath.."datamodel")
require(MyPath.."workspace")
require(MyPath.."basepart")
require(MyPath.."camera")--]]
return {
    ServiceProvider = require(MyPath.."serviceprovider"),
    DataModel = require(MyPath.."datamodel"),
    UserInputService = require(MyPath.."userinputservice"),
    ReplicatedStorage = require(MyPath.."replicatedstorage"),
    ServerStorage = require(MyPath.."serverstorage"),
    ServerScriptService = require(MyPath.."serverscriptservice"),
    Players = require(MyPath.."players"),
    Player = require(MyPath.."player"),
    BasePlayerGui = require(MyPath.."baseplayergui"),
    PlayerGui = require(MyPath.."playergui"),
    GuiBase2D = require(MyPath.."guibase2d"),
    GuiObject = require(MyPath.."guiobject"),
    Frame = require(MyPath.."Frame"),
    StarterGui = require(MyPath.."startergui"),
    ScreenGui = require(MyPath.."screengui"),
    BasePart = require(MyPath.."basepart"),
    Workspace = require(MyPath.."workspace"),
    ["RunService"] = require(MyPath.."runservice"),
    Camera = require(MyPath.."camera"),
    Model = require(MyPath.."model"),
    InputObject = require(MyPath.."inputobject"),
}