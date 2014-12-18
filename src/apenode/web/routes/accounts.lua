-- Copyright (C) Mashape, Inc.

local AccountModel = require "apenode.models.account"
local BaseController = require "apenode.web.routes.base_controller"

local Accounts = {}
Accounts.__index = Accounts

setmetatable(Accounts, {
  __index = BaseController, -- this is what makes the inheritance work
  __call = function (cls, ...)
    local self = setmetatable({}, cls)
    self:_init(...)
    return self
  end,
})

function Accounts:_init()
  BaseController:_init(AccountModel) -- call the base class constructor
end

return Accounts