DROP TABLE IF EXISTS payments, bookings, addresses, services, users CASCADE;
DROP TYPE IF EXISTS user_role;

CREATE TYPE user_role AS ENUM ('customer', 'beautician', 'admin');

CREATE TABLE users (
  id            SERIAL PRIMARY KEY,
  name          TEXT NOT NULL,
  phone         TEXT UNIQUE NOT NULL,
  email         TEXT UNIQUE,
  password_hash TEXT NOT NULL,
  role          user_role NOT NULL DEFAULT 'customer',
  created_at    TIMESTAMPTZ NOT NULL DEFAULT now()
);

CREATE TABLE services (
  id               SERIAL PRIMARY KEY,
  name             TEXT NOT NULL,
  description      TEXT,
  price_paise      INTEGER NOT NULL CHECK (price_paise > 0),
  duration_minutes INTEGER NOT NULL,
  is_active        BOOLEAN NOT NULL DEFAULT true
);
CREATE TABLE addresses (
  id SERIAL PRIMARY KEY,
  user_id INTEGER NOT NULL REFERENCES users(id),
  line1 TEXT NOT NULL,
  city TEXT NOT NULL,
  pincode CHAR(6) NOT NULL,
  latitude TEXT NOT NULL,
  longitude TEXT NOT NULL
);
CREATE TABLE bookings(
  id SERIAL PRIMARY KEY,
  customer_id INTEGER NOT NULL REFERENCES users(id),
  beautician_id INTEGER NOT NULL REFERENCES users(id),
  service_id INTEGER NOT NULL REFERENCES services(id),
  address_id INTEGER NOT NULL REFERENCES addresses(id),
  scheduled_at TIMESTAMPTZ NOT NULL DEFAULT now(),
  status TEXT DEFAULT 'Pending' ,
  total_amount INTEGER NOT NULL,
  created_at TIMESTAMPTZ NOT NULL DEFAULT now()

);
CREATE TABLE payments(
  id INTEGER PRIMARY KEY,
  booking_id INTEGER REFERENCES bookings(id),
  razorpay_order_id TEXT UNIQUE NOT NULL,
  staus TEXT DEFAULT 'Pending',
  amount INTEGER NOT NULL ,
  created_at TIMESTAMPTZ NOT NULL DEFAULT now()
);