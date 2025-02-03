import  express from 'express';
import pool from './db.js';


const app = express();
const port = 3001;



app.use(express.json());

//routes 
app.get('/',(req,res) =>{
    res.sendStatus(200);
})

app.post('/', (req, res) => {
    const {name, company} = req.body
    res.send(`The params were ${name} and ${company}`);
})

app.get('/list',async (req,res) =>{
    try{
         const listData = await pool.query('SELECT * FROM public."List"');
         console.log(listData);
         res.send({data: listData.rows});
    }catch(e){
        console.log(e);
        res.sendStatus(500);
    }
})

app.post('/list',async (req,res) =>{
    try{
         const {id, name, description, allowReservation} = req.body;
         const listData = await pool.query('INSERT INTO public."List"("id", "name", "description", "allowReservation") VALUES ($1, $2, $3, $4)',[id, name, description, allowReservation]);
         console.log(listData);
         res.send({data: listData.rows});
    }catch(e){
        console.log(e);
        res.sendStatus(500);
    }
})

app.post('/item',async (req,res) =>{
    try{
         const {id, name, image, link, isReserved, listId} = req.body;
         const listData = await pool.query('INSERT INTO public."Item"("id", "name", "image", "link","isReserved", "listId") VALUES ($1, $2, $3, $4, $5, $6)',[id, name, image, link,isReserved, listId]);
         console.log(listData);
         res.send({data: listData.rows});
    }catch(e){
        console.log(e);
        res.sendStatus(500);
    }
})

app.listen(port, () => console.log(`Server is running on ${port}`));