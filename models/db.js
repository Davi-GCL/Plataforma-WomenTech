// Conexao com o banco de dados:
const Sequelize = require('sequelize');
const sequelize = new Sequelize('crud_node','root','root',{host: 'localhost',
dialect: 'mysql'})

module.exports = {
    Sequelize: Sequelize,
    sequelize: sequelize
}