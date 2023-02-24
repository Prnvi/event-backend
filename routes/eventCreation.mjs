import { response } from "express";
import { pool } from "../db/db.mjs";

export const eventCreation = async (req,res) => {

console.log('register');
try {
    console.log(req.body,"register");
    const { e_title , category, e_sub_category,e_description,e_location,e_organizer,e_date,e_start_time,e_end_time,free,paid,e_capacity,login_id} = req.body;
    const newEntry = await pool.query('INSERT INTO event ( e_title , category, e_sub_category,e_description,e_location,e_organizer,e_date,e_start_time,e_end_time,free,paid,e_capacity,login_id) VALUES ($1, $2,$3,$4,$5,$6,$7,$8,$9,$10,$11,$12,$13)', [e_title , category, e_sub_category,e_description,e_location,e_organizer,e_date,e_start_time,e_end_time,free,paid,e_capacity,login_id]
      );
      res.send(req.body)
} catch (err) {
        console.error(err)
        return res.status(500).send({error:"internal server error"})
    }

}

