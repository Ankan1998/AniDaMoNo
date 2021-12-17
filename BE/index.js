const express = require('express')

const app = express()
const port = process.nextTick.PORT || 3000

app.use(express.json())

app.listen(port,()=>{
    console.log('Server listening at Port: ' + port)
})