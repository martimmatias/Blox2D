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
    BasePart = require(MyPath.."basepart"),
    Workspace = require(MyPath.."workspace"),
    ["Run Service"] = require(MyPath.."runservice"),
    Camera = require(MyPath.."camera"),
}