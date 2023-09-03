-- banco de dados e-commerce--
-- drop database ecommerce;
create database ecommerce;

use ecommerce;

-- criando tabela cliente
CREATE TABLE clients (
            idClients INT AUTO_INCREMENT PRIMARY KEY,
            TipoCliente ENUM('PF', 'PJ') NOT NULL,
            Nome VARCHAR(100),
            RazaoSocial VARCHAR(100),
            CNPJ CHAR(14),
            CPF CHAR(11),
            Address VARCHAR(100),
            CONSTRAINT unique_cliente_cpf_cnpj UNIQUE(CPF, CNPJ),
            CONSTRAINT ck_tipo_cliente CHECK (TipoCliente IN ('PF', 'PJ'))
);
alter table clients auto_increment=1;

-- criando tabela produto 
create table Product(
			idProduct int auto_increment primary key,
            Pname varchar (150) not null,
            Size Enum('P','M','G','GG'),
            category enum("Camisas","Moleton","calças") not null,
            avaliação_produto float default 1
);
-- crinando tabela de pagamento
CREATE TABLE paymentmethods (
            idPayment INT AUTO_INCREMENT PRIMARY KEY,
            PaymentMethod VARCHAR(50)
);

CREATE TABLE clientpayment (
            idClient INT,
            idPayment INT,
            PRIMARY KEY (idClient, idPayment),
            FOREIGN KEY (idClient) REFERENCES clients(idClients),
            FOREIGN KEY (idPayment) REFERENCES paymentmethods(idPayment)
        );
-- criando tabela pedido

create table orders(
			idOrders int auto_increment primary key,
            idOrderClient int,
            OrderStatus ENUM('Cancelado', 'Confirmado', 'A caminho','Em processamento') DEFAULT 'Em processamento',
            DeliveryStatus ENUM('Pendente', 'Em trânsito', 'Entregue') DEFAULT 'Pendente',
            TrackingCode VARCHAR(50),
            OrderDescripition varchar (255),
            SendValue float default 0,
            paymentCash bool default false,
            constraint fk_orders_client foreign key (idOrderClient) references clients(idClients)
            on update cascade
);

-- criando table estoque
create table productstorage(
			idproduct_storage int auto_increment primary key,
			sorage_location varchar (255),
            quantity float default 0        
);

-- criando tabela fornecedor
create table supplier(
			idSupplier int auto_increment primary key,
			socialName varchar (255) not null,
            CNPJ char(15) not null,
            contact varchar(11) not null,
            constraint unique_supplier unique (CNPJ)
);

-- criando tabela vendedor
create table seller(
			idSeller int auto_increment primary key,
			socialName varchar (255) not null,
            abstName varchar (255),
            CNPJ char(15) not null,
            CPF char (9),
            location varchar (255),
            contact varchar(11) not null,
            constraint unique_seller_CNPJ unique (CNPJ),
            constraint unique_seller_CPF unique (CPF)
);


create table productSeller(
			idPseller int,
            idPproduct int,
            prodQuantity int default 1,
            primary key (idPseller, idPproduct),
            constraint fk_productSeller_idPseller foreign key (idPseller) references seller(idSeller),
            constraint fk_productSeller_idProduct foreign key (idPproduct) references Product(idProduct)
);

create table productOrder(
            idPOproduct int,
            idPOorder int,
            poQuantity int default 1,
            poStatus enum("Disponivel","Sem estoque") default "Disponivel",
            primary key (idPOproduct, idPOorder),
            constraint fk_productOrder_seller foreign key (idPOproduct) references product(idProduct),
            constraint fk_productOrder_product foreign key (idPOorder) references orders(idOrders)
);
create table productlocation(
            idLproduct int,
            idLstorage int,
            locations varchar(255)not null,
            primary key (idLproduct, idLstorage),
            constraint fk_storage_location_product foreign key (idLproduct) references product(idProduct),
            constraint fk_storage_location_storage foreign key (idLstorage) references productstorage(idproduct_storage)
);

create table productSupplier(
            idpsSupplier int,
            idpsProduct int,
            quantity int not null,
            primary key (idpsSupplier, idpsProduct),
            constraint fk_product_supplier_supplier foreign key (idpsSupplier) references supplier(idSupplier),
            constraint fk_product_supplier_product foreign key (idpsProduct) references product(idProduct)
);

use information_schema;
select * from referential_constraints where constraint_schema = 'ecommerce';
