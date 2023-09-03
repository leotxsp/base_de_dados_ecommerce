use ecommerce;
-- seleciona clientes --
SELECT * FROM clients;

-- seleciona clientes com o cpf especifico --
SELECT * FROM clients WHERE CPF = '12345678901';

-- calcula o valor total gasto em pedidos de um cliente especifico -- 
SELECT idOrderClient, SUM(SendValue) AS TotalGasto FROM orders WHERE idOrderClient = 1 GROUP BY idOrderClient;

-- lista todos os produtos em ordem alfabetica
SELECT * FROM Product ORDER BY Pname;

-- procura clientes que ja compraram mais de 100 reais --
SELECT idOrderClient, SUM(SendValue) AS TotalGasto FROM orders GROUP BY idOrderClient HAVING TotalGasto > 100;

-- associa clientes com seus pedidos -- 
SELECT orders.idOrders, clients.Fname, clients.Lname, orders.OrderDescripition, orders.SendValue
FROM orders
INNER JOIN clients ON orders.idOrderClient = clients.idClients;