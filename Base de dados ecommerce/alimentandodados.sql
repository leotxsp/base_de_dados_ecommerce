
use ecommerce;

INSERT INTO clients (Fname, Minit, Lname, CPF, Address) VALUES
('João', 'A', 'Silva', '12345678901', 'Rua Principal, 123'),
('Maria', 'B', 'Santos', '98765432109', 'Rua das Flores, 456'),
('Carlos', 'C', 'Pereira', '45678901234', 'Avenida Central, 789');


INSERT INTO Product (Pname, Size, category, avaliação_produto) VALUES
('Camiseta Vermelha', 'M', 'Camisas', 4.5),
('Moletom Azul', 'G', 'Moleton', 4.0),
('Calça Jeans Preta', 'GG', 'Calças', 3.8),
('Camiseta Branca', 'P', 'Camisas', 4.2),
('Moletom Cinza', 'G', 'Moleton', 4.1);


INSERT INTO supplier (socialName, CNPJ, contact) VALUES
('Fornecedor A', '12345678901234', '555-1234'),
('Fornecedor B', '98765432109876', '555-5678');


INSERT INTO seller (socialName, abstName, CNPJ, CPF, location, contact) VALUES
('Vendedor 1', 'ABC EIRELE', '11122334455667', '123456789', 'Rua do Vendedor, 123', '555-1111'),
('Vendedor 2', 'XYZ ME', '77788990001122', '987654321', 'Rua do Vendedor, 456', '555-2222');


INSERT INTO productSeller (idPseller, idPproduct, prodQuantity) VALUES
(1, 1, 100),
(2, 2, 50),
(2, 3, 75);

INSERT INTO clients (TipoCliente, Nome, RazaoSocial, CNPJ, CPF, Address)
VALUES
('PF', 'João da Silva', NULL, NULL, '12345678901', 'Rua Principal, 123'),
('PJ', NULL, 'Empresa ABC', '12345678901234', NULL, 'Avenida Comercial, 456');

INSERT INTO paymentmethods (PaymentMethod)
VALUES
('Cartão de Crédito'),
('Boleto Bancário'),
('PayPal');

INSERT INTO clientpayment (idClient, idPayment)
VALUES
(1, 1), 
(1, 3), 
(2, 2); 


INSERT INTO productstorage (sorage_location, quantity) VALUES
('Depósito A', 200),
('Depósito B', 150);


INSERT INTO productSupplier (idpsSupplier, idpsProduct, quantity) VALUES
(1, 1, 500),
(2, 2, 300);

INSERT INTO orders (idOrderClient, OrderDescripition, SendValue, paymentCash) VALUES
(1, 'Pedido 1', 50.0, true),
(2, 'Pedido 2', 75.5, false),
(3, 'Pedido 3', 30.0, true);


INSERT INTO productOrder (idPOproduct, idPOorder, poQuantity, poStatus) VALUES
(1, 1, 10, 'Disponível'),
(2, 1, 5, 'Sem estoque'),
(3, 2, 15, 'Disponível');

INSERT INTO orders (idOrderClient, OrderStatus, DeliveryStatus, TrackingCode, OrderDescripition, SendValue, paymentCash)
VALUES
(1, 'Confirmado', 'Pendente', 'TR12345', 'Pedido 1', 50.0, true),
(2, 'Confirmado', 'Em trânsito', 'TR56789', 'Pedido 2', 75.5, false),
(1, 'Confirmado', 'Entregue', 'TR54321', 'Pedido 3', 30.0, true);


INSERT INTO productlocation (idLproduct, idLstorage, locations) VALUES
(1, 1, 'Prateleira 1, Estante A'),
(2, 1, 'Prateleira 2, Estante B'),
(3, 2, 'Prateleira 3, Estante C');