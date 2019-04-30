/**
 * Sample transaction
 * @param {delivery.VerifyUser} tx
 * @transaction
 */

function VerifyUser(tx){
   // var q = buildQuery('SELECT delivery.Transporter WHERE (holderId == _$Username AND password == _$Password)');
   
    return query('IsTransporterValid',{Username:tx.username, Password:tx.password})
    .then(function(transporter){
        console.log("@debug transporter length "+transporter.length)

        if(transporter.length > 0)
        {
            console.log("@debug returning transporter success")
            return transporter[0]
        }
        else
        {   
            return query('IsWarehouseValid',{Username:tx.username, Password:tx.password})
            .then(function(warehouse){
                console.log("@debug warehouse length "+warehouse.length)
        
                if(warehouse.length > 0)
                {
                    console.log("@debug returning warehouse success")
                    return warehouse[0]
                }
                else
                {   console.log("@debug throwing warehouse error")
                    throw 401
                }
            })
        }
    })
}

