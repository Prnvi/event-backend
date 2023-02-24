
import pkg from 'pg';
const { Pool } = pkg;

export const pool = new Pool({
    user: "postgres",
    password:"new_password",
    host: "localhost",
    port: "5432",
    database: "event_database"
})
export const dbConnect = () => {
    pool.connect((err) => {
      if (err) {
        console.error("connection error", err.stack);
      } else {
        console.log("connected");
      }
    });
  };

