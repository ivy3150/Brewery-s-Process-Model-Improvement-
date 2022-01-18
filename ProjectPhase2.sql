--Customer Table

create table customer (
Customer_ID varchar(10) not null constraint customer_ID_PK primary key,
Customer_Type varchar(30) not null,
Customer_First_Name varchar(30) not null,
Customer_Last_Name varchar (30) not null,
Transaction_Method varchar(30),
Customer_Street varchar(30) not null,
Customer_City varchar(30) not null,
Customer_state varchar(20) not null,
Customer_Postal_Code number(5) not null,
Customer_phone_number varchar(30) not null)
;



-- order table

Create table order_1 (
order_ID varchar(10) not null constraint order_ID_PK primary key,
Customer_ID varchar(10) not null,
order_comments varchar(100),
Order_Date date default sysdate not null,
constraint Customer_ID_FK foreign key(Customer_ID) references customer (Customer_ID)
)
;

-- product_line table


create table product_line (
Product_Line_ID varchar(10) not null constraint Product_Line_ID_PK primary key,
Batch_ID varchar(10) not null,
ABV number (2,1) not null,
Best_buy_date date not null
)
;

-- prodcuts table


create table Products (
product_id varchar(10) not null constraint product_ID_PK primary key,
product_line_ID varchar(10) not null,
type_of_beer varchar(30),
quanity number(5) not null,
unit_volume number(5,1) not null,
container varchar(15) not null,
constraint product_line_ID_FK foreign key (product_line_ID) references product_line (Product_Line_ID)
)
;





--product order ID

create table product_order (
Product_Order_ID varchar(10) not null,
product_ID varchar(10) not null,
order_ID varchar(10) not null,
order_cost number (5,2),
order_date date default sysdate,
product_quantity number(10),
constraint product_order_ID_PK primary key (Product_Order_ID),
constraint product_ID_FK foreign key (product_ID) references products (product_ID),
constraint order_ID_FK foreign key(order_ID) references order_1 (order_ID)
)
;





-- employee

create table employee (
Employee_ID varchar(10) not null constraint Employee_ID_PK primary key,
Product_Line_ID varchar(10) not null,
Insepection_ID varchar(10) not null,
Employee_street varchar(30) not null,
employee_city varchar (30) not null,
employee_state varchar(30) not null,
Employee_Postal_Code number(5) not null,
Employee_First_Name varchar(30) not null,
Employee_Last_Name varchar(30) not null,
Employee_Phone_Number varchar(30)
constraint FK_product_line_ID foreign key (Product_Line_ID) references product_line (Product_Line_ID)
)
;


--Suppplier ID

create table Suppliers (
Supplier_ID varchar(10) not null constraint Supplier_ID_PK2 primary key,
Supplier_Name varchar (30) not null,
Supplier_street varchar (30) not null,
Supplier_city varchar(30) not null,
supplier_state varchar(30) not null,
supplier_postal_code number(5) not null,
Supplier_phone_number varchar(30) not null
)
;


-- Raw Materials 
create table raw_materials (
raw_material_ID varchar(10),
Supplier_ID varchar(10),
Product_line_ID varchar(10),
constraint raw_material_ID primary key (raw_material_ID),
constraint Supplier_ID_FK foreign key (Supplier_ID) references Suppliers (Supplier_ID),
constraint Projet_line_FK3 foreign key (Product_line_ID) references product_line (Product_Line_ID)
)
;













