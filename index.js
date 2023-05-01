import express from 'express'
// const express = require("express")
const app = express();
// const handlebars = require('express-handlebars');
import handlebars from 'express-handlebars';

// const bodyParser = require('body-parser');
// const mysql = require('mysql2');
import mysql from 'mysql2';
// const path = require('path')
import * as path from 'path';

import {PORT, 
    DB_HOST,
    DB_USER,
    DB_PASSWORD,
    DB_NAME,
    DB_PORT} from './config.js';

//Configuração do banco de dados com a lib 'mysql2'
const conn = mysql.createPool({
    host: DB_HOST,
    user:   DB_USER,
    password: DB_PASSWORD,
    database: DB_NAME,
    port: DB_PORT
})

//Template Engine 
    app.engine('handlebars', handlebars.engine({defaultLayout: 'main'}))
    app.set('view engine', 'handlebars')

//Metodo substituto do 'Body Parser'
    app.use(express.urlencoded({extended: false}))
    app.use(express.json())

// Public
    app.use(express.static('public'))
    //app.use(express.static('public'));


//Rotas
    app.get('/',(req,res)=>{
        res.render('index')
    })

    app.get('/cursos',(req,res)=>{
        conn.query('SELECT * FROM cursos WHERE id < 7', (err,results)=>{
            if(err){
                console.error(err);
                res.status(500).send('Erro ao buscar dados na tabela');
            } else{
                res.render('cursos', {cursos: results});
            }
        });

    });

    app.get('/cursos/todos',(req,res)=>{
        conn.query('SELECT * FROM cursos', (err,results)=>{
            if(err){
                console.error(err);
                res.status(500).send('Erro ao buscar dados no banco');
            } else{
                res.render('cursosexp', {cursos: results});
            }
        });

    });

    app.get('/depoimentos',(req,res)=>{
        conn.query('SELECT * FROM comentarios WHERE confirm = 1', (err, results)=>{
            if(err){
                console.error(err);
                res.status(500).send('Erro ao buscar dados no banco');
            } else{
                res.render('depoimentos',{depoimentos: results});
            }
        })
    })

    var envio = null; //Indica se o formulario já foi enviado, para exibir a mensagem de envio

    app.get('/form',(req,res)=>{
        res.render('form',{envio:envio})
        envio = null;
    })

    // app.get('/form',(req, res) => {
    //     res.sendFile(__dirname + '/public/formu.html');
    //   });

    app.post('/depoimentos/add',(req,res)=>{
        //A funcao mysql.escape() 'escapa' valores recebidos via POST dos formularios, evitando SQL injection
        const nome = mysql.escape(req.body.nome);
        const email = mysql.escape(req.body.email);
        const instituicao = mysql.escape(req.body.instituicao);
        const texto = mysql.escape(req.body.texto);

        //Executa a consulta SQL para inserir os dados no DB
        conn.query('INSERT INTO comentarios (nome, email,instituicao,texto) VALUES(?,?,?,?)', [nome,email,instituicao,texto], (error, results)=>{
            if(error){
                res.send('Erro ao inserir dados'); console.log(error)
            } else{
                envio = 1; 
                console.log(results);                 
                res.redirect('/form')
            }
        })
        
    })

    app.get('/livros', async(req,res)=>{
        const [results] = await conn.promise().query('SELECT * FROM livros as RESULTS');
            if(!results){
                console.error(err);
                res.status(500).send('Erro ao buscar dados no banco');
            } else{
                res.render('livros',{livros:results})
            }
    });
   
    
// Inicie a conexão com o banco de dados e inicie o servidor
    conn.getConnection((err, connection) => {
        if (err) {
            console.error('Erro ao conectar ao banco de dados: ', err);
        } else {
            console.log('Conectado ao banco de dados com sucesso!');
            app.listen(PORT,()=>{
                console.log("servidor rodando! Porta: ", PORT)
            });
        }
    });


// CODIGO USADO PARA INSERIR CURSOS NA MAO
// const cursos = [
//     {
//         id: 1,
//         nome:"Trilha Crie um site simples",
//         desc:"Se você estiver interessado em iniciar o desenvolvimento Web. Esta trilha reúne seis cursos que podem auxiliar você nesta tarefa.",
//         materia: 'Programação',
//         modo: 'Online',
//         img: "./styles/imgs/curso-img.jpg",
//         link: "https://www.ev.org.br/cursos/crie-um-site-simples-usando-html-css-e-javascript"
//       },
//       {
//         id: 2,
//         nome:"Big Data & Analytics",
//         desc:"A arte de transformar dados em informação é desbloquear o valor dos dados. Juntos, Big Data e Analytics (BDA) prometem transformar a maneira com que as empresas fazem negócios.",
//         materia: 'Programação',
//         modo: 'Online',
//         img: "./styles/imgs/curso-img.jpg",
//         link: "https://eucapacito.com.br/curso-ec/big-data-analytics/"
//       },
//       {
//         id: 3,
//         nome:"Design Gráfico",
//         desc:"Ao testar convenções de estrutura de páginas, diferentes arranjos em colunas e opções pictóricas, o designer chega a visão da conceitualização do conteúdo que ele deseja transmitir.",
//         materia: 'Design',
//         modo: 'Online',
//         img: "./styles/imgs/curso-img.jpg",
//         link: "https://eucapacito.com.br/curso-ec/design-grafico"
//       },
//       {
//         id: 4,
//         nome:"Python",
//         desc:"A linguagem Python é considerada uma das melhores para iniciantes na programação, além de ser muito poderosa. Aprenda os principais recursos desta linguagem.",
//         materia: 'Programação',
//         modo: 'Online',
//         img: "./styles/imgs/curso-img.jpg",
//         link: "https://eucapacito.com.br/curso-ec/python"
//       },
//       {
//         id: 5,
//         nome:"Introdução a Redes de Computadores",
//         desc:"Você aprenderá conceitos importantes sobre como as redes funcionam... tipos de redes, meios e formas de transmissão de dados, cabeamento estruturado, arquitetura de redes, protocolo TCP/IP, etc...",
//         materia: 'T.I',
//         modo: 'Online',
//         img: "./styles/imgs/curso-img.jpg",
//         link: "https://www.ev.org.br/cursos/introducao-a-redes-de-computadores"
//       },
//       {
//         id: 6,
//         nome:"Fundamentos de TI: Hardware e Software",
//         desc:"O objetivo deste curso é apresentar os conceitos básicos da informática, os componentes dos computadores, os sistemas lógicos e as principais funções que envolvem o poder computacional.",
//         materia: 'T.I',
//         modo: 'Online',
//         img: "./styles/imgs/curso-img.jpg",
//         link: "https://www.ev.org.br/cursos/introducao-a-redes-de-computadores"
//       }
// ]

// cursos.forEach((curso)=>{
//     conn.query('INSERT INTO cursos SET ?',curso);
// })