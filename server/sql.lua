function sqlfetchAll(query, params)
    return MySQL.query ~= nil and MySQL.query.await(query, params) or exports['oxmysql']:executeSync(query, params)
end

-- Define the fetchScalar function using oxmysql functions
function sqlFetchscalar(query, params)
    return MySQL.scalar ~= nil and MySQL.scalar.await(query, params) or exports['oxmysql']:scalarSync(query, params)
end

-- Define the execute function using oxmysql functions
function sqlExecute(query, params)
    return MySQL.update ~= nil and MySQL.update.await(query, params) or exports['oxmysql']:executeSync(query, params)
end

exports("sqlfetchAll", sqlfetchAll)
exports("sqlFetchscalar", sqlFetchscalar)
exports("sqlExecute", sqlExecute)