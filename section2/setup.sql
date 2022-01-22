BEGIN;
CREATE TABLE public.transaction (
  id integer NOT NULL GENERATED ALWAYS AS IDENTITY (INCREMENT 1 START 1 MINVALUE 1),
  transaction_date timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  staff_id varchar(10) NOT NULL,
  customer_id varchar(10) NOT NULL,
  car_id varchar(10) NOT NULL,
  CONSTRAINT transaction_primary_key PRIMARY KEY (id)
);
CREATE TABLE public.car (
  id varchar(10) NOT NULL,
  manufacturer varchar(30) NULL,
  model_name varchar(30) NULL,
  weight numeric(18, 2) NULL,
  price numeric(18, 2) NULL,
  CONSTRAINT car_primary_key PRIMARY KEY (id)
);
CREATE TABLE public.customer (
  id varchar(10) NOT NULL,
  name varchar(120) NULL,
  phone varchar(10) NULL,
  CONSTRAINT customer_primary_key PRIMARY KEY (id)
);
CREATE TABLE public.staff (
  id varchar(10) NOT NULL,
  name varchar(120) NULL,
  phone varchar(10) NULL,
  CONSTRAINT staff_primary_key PRIMARY KEY (id)
);
ALTER TABLE
  public.transaction
ADD
  CONSTRAINT fk_car_id FOREIGN KEY (car_id) REFERENCES public.car(id);
ALTER TABLE
  public.transaction
ADD
  CONSTRAINT fk_customer_id FOREIGN KEY (customer_id) REFERENCES public.customer(id);
ALTER TABLE
  public.transaction
ADD
  CONSTRAINT fk_staff_id FOREIGN KEY (staff_id) REFERENCES public.staff(id);
INSERT INTO
  car(id, manufacturer, model_name, weight, price)
VALUES
  ('C1', 'Honda', 'Civic', 1250, 120000),
  ('C2', 'Toyata', 'Vios', 1200, 90000),
  ('C3', 'Toyota', 'Camry', 1260, 125000),
  ('C4', 'Audi', 'A3 Sedan', 1280, 150000);
INSERT INTO
  customer(id, name, phone)
VALUES
  ('K1', 'Ali', '88884444'),
  ('K2', 'Xiao Ming', '88888888'),
  ('K3', 'Thara', '88889999');
INSERT INTO
  staff(id, name, phone)
VALUES
  ('S1', 'Yang Yang', '88884441'),
  ('S2', 'Hisham', '88888881'),
  ('S3', 'Nadia', '88889991');
INSERT INTO
  transaction(transaction_date, staff_id, customer_id, car_id)
VALUES
  ('2022-01-01 10:00:00', 'S1', 'K1', 'C1'),
  ('2022-01-02 11:00:00', 'S2', 'K2', 'C2'),
  ('2022-01-02 12:00:00', 'S3', 'K3', 'C4');
END;