Timer = class()

--Initialize timer with time in seconds.
function Timer:init(time)
    self.time = time
    self._registeredFunctions = {}
end

--Tick down the timer by the specified amount of seconds. Should be used with love.update()'s "dt" argument.
function Timer:tick(dt)
    self.time = self.time - dt
end

--Check if the timer is done.
function Timer:isDone()
    if self.time <= 0 then
        return true
    else
        return false
    end
end

--Check if the timer is done. If it is done, also call all registered functions.
function Timer:checkDone()
    if self:isDone() then
        for i, func in pairs(self._registeredFunctions) do
            if func and func.func then
                func.func(unpack(func.args))
            end
        end
        return true
    else
        return false
    end
end

--Register a function to be called. First argument is a function, all arguments after that will be passed to the function.
function Timer:register(func, ...)
    table.insert(self._registeredFunctions, {"function" = func, "args" = {...}})
end

--Unregister a previously registered function.
function Timer:unregister(func)
    for i, registeredFunc in pairs(self._registeredFunctions) do
        if func == registeredFunc then
            table.remove(self._registeredFunctions, i)
        end
    end
end