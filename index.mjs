import express from "express";
import cors from "cors";
import { dbConnect } from "./db/db.mjs";
import { register } from "./routes/register.mjs";
import { eventCreation } from "./routes/eventCreation.mjs";


const app = express();

//middleware
app.use(cors());
app.use(express.json());//req.body
dbConnect()
//routes
//get request

app.get('/',(req,res) =>{
    res.send('started on port 5001')
})
//create a user login
app.post("/register",register)
app.post("/event",eventCreation)
//get all users

//get a user

//update user

//delete a user

app.listen(5001, ()=>{
    console.log('server has started on port 5001')

})