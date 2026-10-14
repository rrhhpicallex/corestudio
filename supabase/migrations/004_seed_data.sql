-- ============================================================
-- Core Studio PCX — Carga inicial de datos reales
-- Generado automáticamente desde index.html + CSV PeopleForce
-- ============================================================

-- Limpiar datos anteriores (orden inverso por FK)
TRUNCATE TABLE comments, reactions, novedades, bajas, leave_requests, photos, employees RESTART IDENTITY CASCADE;

-- ─── EMPLEADOS ──────────────────────────────────────────────
INSERT INTO employees (id, name, initials, title, dept, level, type, country, hire_date, dob, email, phone, gender, address, health_insurance, manager_name, manager_email, color, status, company, probation_end_date, probation_status, termination_date, termination_type, manager_since_date) VALUES
  ('E39', 'Agustin Serra', 'AS', 'IP Telephony Software Development Specialist', 'Desarrollo', 'Junior', 'Full-time', 'Argentina', '2025-03-10', '1998-03-12', 'agustin@picallex.com', '358-437-4235', 'Masculino', 'Río Cuarto, Córdoba', '', 'Juan Carlos González Cardona', 'juan@picallex.com', '#3d6b8a', 'active', 'VIP2Phone', NULL, NULL, NULL, NULL, '2025-03-10'),
  ('I21', 'Alejandra Gregoris', 'AG', 'Legal Officer', 'Legales', 'Senior', 'Consultor a Demanda', 'Argentina', '2021-04-01', '1995-08-14', 'alejandra@picallex.com', '338-544-7686', 'Femenino', 'Argentina', '', 'Marcelo Sosa', 'marcelo@picallex.com', '#5c2d7a', 'active', 'PicallEx', NULL, NULL, NULL, NULL, '2021-04-01'),
  ('E41', 'Alimar Rea Tovar', 'AR', 'Growth Marketing Specialist', 'Marketing', 'Semi Senior', 'Full-time', 'Colombia', '2025-07-23', '1992-12-02', 'alimar@picallex.com', '+57 350 8222519', 'Femenino', 'Colombia', '', 'Carlos Andrés Fonseca Manrique', 'carlos@picallex.com', '#7a4a2d', 'terminated', 'PicallEx', NULL, NULL, '2026-10-01', NULL, '2025-07-23'),
  ('E40', 'Augusto Kohler', 'AK', 'KAS - Key Account Support', 'CX', 'Junior', 'Full-time', 'Argentina', '2025-04-01', '2003-03-12', 'augusto@picallex.com', '358-513-7247', 'Masculino', 'Río Cuarto, Córdoba', '', 'Melisa Soledad Diaz Gonzalez', 'melisa@picallex.com', '#6b3d8a', 'active', 'PicallEx', NULL, NULL, NULL, NULL, '2025-04-01'),
  ('I11', 'Bruno Alexander Alaminos', 'BA', 'Developer Backend', 'Desarrollo', 'Senior', 'Full-time', 'Argentina', '2015-11-16', '1991-02-17', 'bruno@picallex.com', '54-358-431-5242', 'Masculino', 'Río Cuarto, Córdoba', '', 'Camila Calcagno', 'camila@picallex.com', '#3d6b8a', 'active', 'PicallEx', NULL, NULL, NULL, NULL, '2015-11-16'),
  ('I31', 'Camila Calcagno', 'CC', 'Product Manager', 'Desarrollo', 'Senior', 'Consultor a Demanda', 'Argentina', '2025-09-01', '1995-02-01', 'camila@picallex.com', '358-487-0654', 'Femenino', 'Río Cuarto, Córdoba', '', 'Diego Alvarez', 'diego@picallex.com', '#3d6b8a', 'active', 'PicallEx', NULL, NULL, NULL, NULL, '2025-09-01'),
  ('E13', 'Candela Lourenco Gorosito', 'CL', 'KAS - Key Account Support', 'CX', 'Senior', 'Full-time', 'Argentina', '2022-02-01', '1999-08-20', 'candela@picallex.com', '358-504-9321', 'Femenino', 'Río Cuarto, Córdoba', '', 'Melisa Soledad Diaz Gonzalez', 'melisa@picallex.com', '#6b3d8a', 'terminated', 'PicallEx', NULL, NULL, '2026-10-01', NULL, '2022-02-01'),
  ('I1', 'Carlos Andrés Fonseca Manrique', 'CF', 'COO - Chief Operating Officer', 'CEO', 'Senior', 'Full-time', 'Estados Unidos', '2005-02-23', '1976-01-01', 'carlos@picallex.com', '+1 (305) 305-4511', 'Masculino', 'Miami, Florida, USA', '', '', NULL, '#1a237e', 'active', 'PicallEx', NULL, NULL, NULL, NULL, '2005-02-23'),
  ('I5', 'Cristian Alvarez', 'CA', 'Developer Backend', 'Desarrollo', 'Senior', 'Full-time', 'Argentina', '2010-08-01', '1981-11-07', 'cristian@picallex.com', '54-358-424-7687', 'Masculino', 'Río Cuarto, Córdoba', '', 'Diego Alvarez', 'diego@picallex.com', '#3d6b8a', 'active', 'PicallEx', NULL, NULL, NULL, NULL, '2010-08-01'),
  ('I6', 'Damian Fernando Morales Barrera', 'DM', 'VoIP Operations Specialist', 'Desarrollo', 'Senior', 'Full-time', 'Argentina', '2012-11-01', '1991-02-25', 'damian@picallex.com', '261-304-2658', 'Masculino', 'Mendoza, Argentina', '', 'Juan Carlos González Cardona', 'juan@picallex.com', '#3d6b8a', 'active', 'PicallEx', NULL, NULL, NULL, NULL, '2012-11-01'),
  ('E10', 'Delfina Ailen Jorge', 'DJ', 'CSA - Customer Service Analyst', 'CX', 'Senior', 'Full-time', 'Argentina', '2022-01-03', '1999-10-23', 'delfina@picallex.com', '54-358-654-0222', 'Femenino', 'Río Cuarto, Córdoba', '', 'Melisa Soledad Diaz Gonzalez', 'melisa@picallex.com', '#6b3d8a', 'active', 'PicallEx', NULL, NULL, NULL, NULL, '2022-01-03'),
  ('I9', 'Diego Alvarez', 'DA', 'CTO - Chief Technology Officer', 'Desarrollo', 'Senior', 'Full-time', 'Argentina', '2014-11-03', '1990-08-17', 'diego@picallex.com', '54-358-439-2498', 'Masculino', 'Río Cuarto, Córdoba', '', 'Marcelo Sosa', 'marcelo@picallex.com', '#3d6b8a', 'active', 'PicallEx', NULL, NULL, NULL, NULL, '2014-11-03'),
  ('A6', 'Elizabeth Arcila Arrieta', 'EA', 'Legal Officer', 'Legales', 'Senior', 'Consultor a Demanda', 'Colombia', '2025-02-03', '1984-10-06', 'elizabeth@picallex.com', '+57 316 411 3517', 'Femenino', 'Colombia', '', 'Carlos Andrés Fonseca Manrique', 'carlos@picallex.com', '#5c2d7a', 'active', 'PicallEx', NULL, NULL, NULL, NULL, '2025-02-03'),
  ('E27', 'Facundo Yobstraibizer', 'FY', 'Developer', 'Desarrollo', 'Semi Senior', 'Full-time', 'Argentina', '2023-07-03', '2000-04-10', 'facundo@picallex.com', '358-422-8723', 'Masculino', 'Río Cuarto, Córdoba', '', 'Camila Calcagno', 'camila@picallex.com', '#3d6b8a', 'active', 'PicallEx', NULL, NULL, NULL, NULL, '2023-07-03'),
  ('I14', 'Federico Nicolás Franco', 'FF', 'Developer Backend', 'BackEnd', 'Senior', 'Full-time', 'Argentina', '2018-06-01', '1993-05-05', 'federico@picallex.com', '54-358-540-7597', 'Masculino', 'Río Cuarto, Córdoba', '', 'Germán Alvarez', 'german@picallex.com', '#2d5a7a', 'active', 'PicallEx', NULL, NULL, NULL, NULL, '2018-06-01'),
  ('I10', 'Fernando Gregoris', 'FG', 'KAM - Key Account Manager', 'CX', 'Senior', 'Full-time', 'Argentina', '2015-05-05', '1992-02-19', 'fernando@picallex.com', '338-543-2405', 'Masculino', 'Córdoba, Argentina', '', 'Melisa Soledad Diaz Gonzalez', 'melisa@picallex.com', '#6b3d8a', 'active', 'PicallEx', NULL, NULL, NULL, NULL, '2015-05-05'),
  ('E37', 'Francisco García', 'FG', 'Developer Backend', 'BackEnd', 'Senior', 'Full-time', 'Colombia', '2020-11-03', '1988-05-21', 'francisco@picallex.com', '+57 604 511 9971', 'Masculino', 'Colombia', '', 'Diego Alvarez', 'diego@picallex.com', '#2d5a7a', 'active', 'PicallEx', NULL, NULL, NULL, NULL, '2020-11-03'),
  ('I20', 'Franco Fernández Lorio', 'FF', 'Developer', 'Desarrollo', 'Senior', 'Full-time', 'Argentina', '2021-01-18', '1999-01-27', 'franco@picallex.com', '54-358-516-6293', 'Masculino', 'Río Cuarto, Córdoba', '', 'Diego Alvarez', 'diego@picallex.com', '#3d6b8a', 'active', 'PicallEx', NULL, NULL, NULL, NULL, '2021-01-18'),
  ('E17', 'Franco Alejandro Muñiz', 'FM', 'Graphics Design', 'C2R', 'Senior', 'Full-time', 'Argentina', '2022-05-17', '1996-11-07', 'fmuniz@picallex.com', '338-544-7231', 'Masculino', 'Córdoba, Argentina', '', 'Natalia Maffini', 'natalia@picallex.com', '#8a5c2d', 'active', 'C2R', NULL, NULL, NULL, NULL, '2022-05-17'),
  ('I17', 'Georgina Zunino', 'GZ', 'HRO - Human Resources Officer', 'RRHH', 'Senior', 'Full-time', 'Argentina', '2020-07-01', '1983-07-08', 'georgina@picallex.com', '358-437-3553', 'Femenino', 'Las Heras 1100, Río Cuarto, Córdoba', 'Swiss Medical', 'Marcelo Sosa', 'marcelo@picallex.com', '#2e7d32', 'active', 'PicallEx', NULL, NULL, NULL, NULL, '2020-07-01'),
  ('E2', 'Germán Alvarez', 'GA', 'Delivery Manager', 'Desarrollo', 'Semi Senior', 'Full-time', 'Argentina', '2020-10-09', '1998-07-22', 'german@picallex.com', '358-548-4084', 'Masculino', 'Río Cuarto, Córdoba', '', 'Diego Alvarez', 'diego@picallex.com', '#3d6b8a', 'active', 'PicallEx', NULL, NULL, NULL, NULL, '2020-10-09'),
  ('I4', 'Gonzalo Martín Sosa', 'GS', 'Visual Arts', 'Artes', 'Senior', 'Full-time', 'Argentina', '2007-10-02', '1981-08-17', 'gonzalo@picallex.com', '54-9-358-483-0925', 'Masculino', 'Río Cuarto, Córdoba', '', 'Marcelo Sosa', 'marcelo@picallex.com', '#6b7a2d', 'active', 'PicallEx', NULL, NULL, NULL, NULL, '2007-10-02'),
  ('E14', 'Josefina Amin', 'JA', 'AA - Accounting Analyst', 'Administración/Billing', 'Junior', 'Full-time', 'Argentina', '2022-02-14', '1997-11-05', 'josefina@picallex.com', '54-358-341-6415', 'Femenino', 'Río Cuarto, Córdoba', '', 'Marcelo Sosa', 'marcelo@picallex.com', '#5a5a8a', 'active', 'PicallEx', NULL, NULL, NULL, NULL, '2022-02-14'),
  ('E42', 'Juan Antuña', 'JA', 'Developer', 'Desarrollo', 'Junior', 'Part-time', 'Argentina', '2025-08-01', '2006-11-18', 'jantuna@picallex.com', '358-601-1301', 'Masculino', 'Río Cuarto, Córdoba', '', 'Federico Nicolás Franco', 'federico@picallex.com', '#3d6b8a', 'active', 'PicallEx', NULL, NULL, NULL, NULL, '2025-08-01'),
  ('I7', 'Juan Carlos González Cardona', 'JG', 'Lead Telephony', 'Desarrollo', 'Senior', 'Full-time', 'Colombia', '2013-08-01', '1981-11-16', 'juan@picallex.com', '+57 300 221 8592', 'Masculino', 'Colombia', '', 'Diego Alvarez', 'diego@picallex.com', '#3d6b8a', 'active', 'VIP2Phone', NULL, NULL, NULL, NULL, '2013-08-01'),
  ('E34', 'Lucas Salzotto', 'LS', 'Developer', 'BackEnd', 'Junior', 'Full-time', 'Argentina', '2024-12-02', '2001-05-13', 'lucas@picallex.com', '358-600-8276', 'Masculino', 'Río Cuarto, Córdoba', '', 'Germán Alvarez', 'german@picallex.com', '#2d5a7a', 'active', 'PicallEx', NULL, NULL, NULL, NULL, '2024-12-02'),
  ('E28', 'Lucia Robledo', 'LR', 'Finance Operations Assistant', 'Administración/Billing', 'Junior', 'Full-time', 'Argentina', '2023-09-04', '1998-10-07', 'lrobledo@picallex.com', '358-433-5223', 'Femenino', 'Río Cuarto, Córdoba', '', 'Marcelo Sosa', 'marcelo@picallex.com', '#5a5a8a', 'active', 'PicallEx', NULL, NULL, NULL, NULL, '2023-09-04'),
  ('E35', 'Lucía Gonzalez Romo', 'LG', 'Paid Media Buyer', 'C2R', 'Junior', 'Full-time', 'Argentina', '2024-12-04', '1998-11-20', 'lgonzalez@picallex.com', '260-434-0608', 'Femenino', 'Argentina', '', 'Natalia Maffini', 'natalia@picallex.com', '#8a5c2d', 'active', 'C2R', NULL, NULL, NULL, NULL, '2024-12-04'),
  ('I3', 'Marcelo Sosa', 'MS', 'CEO - Chief Executive Officer', 'CEO', 'Senior', 'Full-time', 'Argentina', '2007-10-01', '1977-01-25', 'marcelo@picallex.com', '358-506-2100', 'Masculino', 'Río Cuarto, Córdoba', '', '', NULL, '#1a237e', 'active', 'PicallEx', NULL, NULL, NULL, NULL, '2007-10-01'),
  ('E20', 'María Agustina Navazzotti', 'MN', 'Paid Media Buyer', 'C2R', 'Senior', 'Full-time', 'Argentina', '2022-08-01', '1995-04-04', 'agustina@picallex.com', '358-484-4127', 'Femenino', 'Río Cuarto, Córdoba', '', 'Natalia Maffini', 'natalia@picallex.com', '#8a5c2d', 'active', 'C2R', NULL, NULL, NULL, NULL, '2022-08-01'),
  ('E26', 'María Antonella Cachambú Marchesi', 'MC', 'KAM - Key Account Manager', 'CX', 'Junior', 'Full-time', 'Argentina', '2023-05-08', '1996-03-18', 'acachambu@picallex.com', '54-358-435-7397', 'Femenino', 'Río Cuarto, Córdoba', '', 'Melisa Soledad Diaz Gonzalez', 'melisa@picallex.com', '#6b3d8a', 'active', 'PicallEx', NULL, NULL, NULL, NULL, '2023-05-08'),
  ('I2', 'María Fernanda Hernández', 'MH', 'Finance Department', 'Finanzas', 'Senior', 'Full-time', 'Estados Unidos', '2005-03-01', '1978-04-21', 'mafer@picallex.com', '786-285-3320', 'Femenino', 'Miami, Florida, USA', '', 'Carlos Andrés Fonseca Manrique', 'carlos@picallex.com', '#2d7a6b', 'active', 'PicallEx', NULL, NULL, NULL, NULL, '2005-03-01'),
  ('A2', 'María Lorena Gianoglio', 'MG', 'VP Culture', 'RRHH', 'Senior', 'Consultor a Demanda', 'Argentina', '2018-08-01', '1972-11-21', 'lorena@picallex.com', '54-358-422-9488', 'Femenino', 'Río Cuarto, Córdoba', '', 'Georgina Zunino', 'georgina@picallex.com', '#2e7d32', 'active', 'PicallEx', NULL, NULL, NULL, NULL, '2018-08-01'),
  ('E24', 'María Zoé Natera', 'MN', 'People Experience & Performance', 'RRHH', 'Semi Senior', 'Full-time', 'Argentina', '2023-03-22', '2000-04-13', 'zoe@picallex.com', '358-486-1320', 'Femenino', 'Sarmiento 480, Río Cuarto, Córdoba', 'OSDE 210', 'Georgina Zunino', 'georgina@picallex.com', '#2e7d32', 'active', 'PicallEx', NULL, NULL, NULL, NULL, '2023-03-22'),
  ('E31', 'Mateo Aguero Formia', 'MA', 'Paid Media Buyer', 'C2R', 'Junior', 'Full-time', 'Argentina', '2024-06-03', '1999-11-05', 'mateo@picallex.com', '54-358-424-6901', 'Masculino', 'Río Cuarto, Córdoba', '', 'Natalia Maffini', 'natalia@picallex.com', '#8a5c2d', 'active', 'C2R', NULL, NULL, NULL, NULL, '2024-06-03'),
  ('E8', 'Matías Gómez', 'MG', 'Developer', 'Desarrollo', 'Senior', 'Full-time', 'Argentina', '2021-10-05', '1999-10-21', 'matias@picallex.com', '54-358-418-1596', 'Masculino', 'Río Cuarto, Córdoba', '', 'Juan Carlos González Cardona', 'juan@picallex.com', '#3d6b8a', 'active', 'VIP2Phone', NULL, NULL, NULL, NULL, '2021-10-05'),
  ('E7', 'Mauro José Herrera', 'MH', 'Account Manager / Digital Marketing Sales', 'C2R', 'Senior', 'Full-time', 'Argentina', '2021-09-01', '1990-01-31', 'mauro@picallex.com', '54-358-460-2883', 'Masculino', 'Río Cuarto, Córdoba', '', 'Natalia Maffini', 'natalia@picallex.com', '#8a5c2d', 'active', 'C2R', NULL, NULL, NULL, NULL, '2021-09-01'),
  ('E30', 'Melisa Soledad Diaz Gonzalez', 'MD', 'Customer Experience Manager', 'CX', 'Senior', 'Full-time', 'Argentina', '2023-12-26', '1995-08-27', 'melisa@picallex.com', '54-351-876-6917', 'Femenino', 'Córdoba, Argentina', '', 'Diego Alvarez', 'diego@picallex.com', '#6b3d8a', 'active', 'PicallEx', NULL, NULL, NULL, NULL, '2023-12-26'),
  ('E32', 'Milagros Delfino', 'MD', 'KAS - Key Account Support', 'CX', 'Senior', 'Full-time', 'Argentina', '2024-06-10', '1996-01-08', 'milagros@picallex.com', '54-358-439-6621', 'Femenino', 'Río Cuarto, Córdoba', '', 'Melisa Soledad Diaz Gonzalez', 'melisa@picallex.com', '#6b3d8a', 'active', 'PicallEx', NULL, NULL, NULL, NULL, '2024-06-10'),
  ('I8', 'Natalia Maffini', 'NM', 'VP - C2R', 'C2R', 'Senior', 'Full-time', 'Argentina', '2013-10-23', '1981-11-19', 'natalia@picallex.com', '358-420-9047', 'Femenino', 'Hipólito Yrigoyen 1420, Río Cuarto, Córdoba', 'OSDE 310', 'Marcelo Sosa', 'marcelo@picallex.com', '#8a5c2d', 'active', 'C2R', NULL, NULL, NULL, NULL, '2013-10-23'),
  ('E1', 'Nicolas Palazesi', 'NP', 'Account Manager', 'C2R', 'Senior', 'Full-time', 'Argentina', '2020-08-04', '1992-12-11', 'nicolas@picallex.com', '358-418-8405', 'Masculino', 'Río Cuarto, Córdoba', '', 'Natalia Maffini', 'natalia@picallex.com', '#8a5c2d', 'active', 'C2R', NULL, NULL, NULL, NULL, '2020-08-04'),
  ('E36', 'Ricardo Franco Muete', 'RF', 'BDE - Business Developer Executive', 'Comercial', 'Semi Senior', 'Full-time', 'Colombia', '2024-12-02', '1995-08-01', 'ricardo@picallex.com', '+57 311 569 6962', 'Masculino', 'Colombia', '', 'Carlos Andrés Fonseca Manrique', 'carlos@picallex.com', '#7a2d5c', 'active', 'PicallEx', NULL, NULL, NULL, NULL, '2024-12-02'),
  ('E23', 'Rosa Arguello', 'RA', 'RRHH', 'RRHH', 'Senior', 'Full-time', 'Argentina', '2022-05-22', '1992-12-26', 'rrhh@picallex.com', '+54 9 3584 19-5896', 'Femenino', 'Río Cuarto, Córdoba', '', 'Georgina Zunino', 'georgina@picallex.com', '#2e7d32', 'active', 'PicallEx', NULL, NULL, NULL, NULL, '2022-05-22'),
  ('E12', 'Tobías Irastorza Rossia', 'TI', 'Developer', 'FrontEnd', 'Senior', 'Full-time', 'Argentina', '2022-02-01', '1999-08-11', 'tobias@picallex.com', '54-358-532-9897', 'Masculino', 'Río Cuarto, Córdoba', '', 'Diego Alvarez', 'diego@picallex.com', '#4a7a9b', 'active', 'PicallEx', NULL, NULL, NULL, NULL, '2022-02-01'),
  ('E4', 'Valentín Cardozo', 'VC', 'Product Analyst', 'Desarrollo', 'Semi Senior', 'Full-time', 'Argentina', '2021-01-25', '1999-03-12', 'valentin@picallex.com', '54-358-437-8774', 'Masculino', 'Río Cuarto, Córdoba', '', 'Camila Calcagno', 'camila@picallex.com', '#3d6b8a', 'active', 'PicallEx', NULL, NULL, NULL, NULL, '2021-01-25'),
  ('I13', 'Victoria Amelia Pérez', 'VP', 'Paid Media Buyer', 'C2R', 'Senior', 'Full-time', 'Argentina', '2018-02-26', '1992-12-30', 'victoriaperez@picallex.com', '358-507-7737', 'Femenino', 'Río Cuarto, Córdoba', '', 'Natalia Maffini', 'natalia@picallex.com', '#8a5c2d', 'active', 'C2R', NULL, NULL, NULL, NULL, '2018-02-26'),
  ('E43', 'Francisco Valentín Barosco Medina', 'FB', 'Technical Support & Automation Engineer', 'CX', '', 'Full-time', 'Argentina', '2026-09-01', '2026-12-01', 'fbarosco@picallex.com', '3585130128', 'Masculino', '', '', 'Melisa Soledad Diaz Gonzalez', 'melisa@picallex.com', '#5c6bc0', 'active', 'PicallEx', '2027-03-01', 'en_curso', NULL, NULL, '2026-09-01'),
  ('E44', 'María Alejandra Niño Orozco', 'MN', '', 'CX', '', 'Full-time', 'Colombia', '2026-09-01', '1995-03-07', 'aorozco@picallex.com', '', 'Femenino', '', '', 'Melisa Soledad Diaz Gonzalez', 'melisa@picallex.com', '#26a69a', 'active', 'PicallEx', '2026-11-01', 'en_curso', NULL, NULL, '2026-09-01');

-- ─── LICENCIAS ──────────────────────────────────────────────
INSERT INTO leave_requests (id, emp_id, type, from_date, to_date, days, status, reviewer, note, ts) VALUES
  ('lr_E39_0', 'E39', 'Extra Day', '2025-08-04', '2025-08-04', 1, 'aprobado', 'María Zoé Natera', '"Equipo, solicito tomarme un Extra Day el día 04-08-2025.
Ya fue coordinado con mi lider y equipo!
Saludos"', '11.07.2025'),
  ('lr_E39_1', 'E39', 'Extra Day', '2025-08-08', '2025-08-08', 1, 'aprobado', 'María Zoé Natera', '"Equipo, solicito tomarme un Extra Day el día 08-08-2025.
Ya fue coordinado con mi lider y equipo!
Saludos"', '11.07.2025'),
  ('lr_E39_2', 'E39', 'Vacaciones', '2026-01-19', '2026-01-25', 7, 'aprobado', 'María Zoé Natera', 'Equipo, solicito mis vacaciones desde el día 19-01-2026 hasta el dia 25-01-2026, reincorporandome el dia 06-02-2026. 
Ya fue coordinado con mi lider y equipo! 
Saludos', '05.01.2026'),
  ('lr_E39_3', 'E39', 'Extra Day', '2026-05-15', '2026-05-15', 1, 'aprobado', 'María Zoé Natera', '', '05.05.2026'),
  ('lr_E39_4', 'E39', 'Extra Day', '2026-09-02', '2026-09-02', 1, 'aprobado', 'María Zoé Natera', '', '24.08.2026'),
  ('lr_I21_0', 'I21', 'Vacaciones', '2025-03-10', '2025-03-24', 15, 'aprobado', 'María Zoé Natera', '"Equipo, solicito mis vacaciones desde el día 10 de marzo 2025 hasta el dia 25 de marzo 2025, reincorporandome el dia 25 de marzo 2025 . 
Ya fue coordinado con mi lider y equipo! 
Saludos"', '13.02.2025'),
  ('lr_I21_1', 'I21', 'Vacaciones', '2025-08-29', '2025-09-05', 8, 'aprobado', 'María Zoé Natera', 'Buenas tardes! Envío el pedido, ya conversado con Chelo, sobre mi ausencia en agosto. Cualquier urgencia, estaré a disposición. Saludos', '30.07.2025'),
  ('lr_I21_2', 'I21', 'Vacaciones', '2026-03-26', '2026-04-08', 14, 'aprobado', 'Alejandra Gregoris', 'Solicito mis vacaciones, ya conversado con Chelo. Gracias!', '11.02.2026'),
  ('lr_E41_0', 'E41', 'Extra Day', '2025-09-12', '2025-09-12', 1, 'aprobado', 'María Zoé Natera', 'Extra Day por viaje para cita con migración Colombia', '11.09.2025'),
  ('lr_E41_1', 'E41', 'Cumpleaños', '2025-12-02', '2025-12-02', 1, 'aprobado', '—', 'Aprobado por líder directo.', ''),
  ('lr_E41_2', 'E41', 'Vacaciones', '2026-05-14', '2026-05-25', 8, 'aprobado', 'María Zoé Natera', 'Reenvío solicitud ajustada', '18.05.2026'),
  ('lr_E41_3', 'E41', 'Extra Day', '2026-08-11', '2026-08-11', 1, 'aprobado', 'María Zoé Natera', '', '07.08.2026'),
  ('lr_E40_0', 'E40', 'Extra Day', '2025-11-14', '2025-11-14', 1, 'aprobado', 'María Zoé Natera', '', '12.11.2025'),
  ('lr_E40_1', 'E40', 'Vacaciones', '2026-01-05', '2026-01-11', 7, 'aprobado', 'María Zoé Natera', 'Me pongo en contacto con el resto de los KAS para organizar guardias en caso de ser aprobadas las vacaciones.', '18.12.2025'),
  ('lr_E40_2', 'E40', 'Cumpleaños', '2026-03-09', '2026-03-09', 1, 'aprobado', '—', '', ''),
  ('lr_E40_3', 'E40', 'Extra Day', '2026-05-18', '2026-05-18', 1, 'aprobado', 'María Zoé Natera', '', '11.05.2026'),
  ('lr_E40_4', 'E40', 'Enfermedad', '2026-06-09', '2026-06-11', 3, 'aprobado', 'María Zoé Natera', 'Certificado', '10.06.2026'),
  ('lr_E40_5', 'E40', 'Vacaciones', '2026-06-22', '2026-06-28', 7, 'aprobado', 'María Zoé Natera', 'Viaje programado a México.', '13.04.2026'),
  ('lr_E40_6', 'E40', 'Enfermedad', '2026-09-10', '2026-09-11', 2, 'aprobado', 'María Zoé Natera', '', '10.09.2026'),
  ('lr_I11_0', 'I11', 'Vacaciones', '2025-03-10', '2025-03-16', 7, 'aprobado', 'María Zoé Natera', 'Ya consulté con Diego e intenté definir una fecha que no se pise con mis compañeros de equipos en los que estoy trabajando de momento.', '13.02.2025'),
  ('lr_I11_1', 'I11', 'Extra Day', '2025-06-06', '2025-06-06', 1, 'aprobado', 'María Zoé Natera', 'Un descanso de mis queridos compañeros :p', '03.06.2025'),
  ('lr_I11_2', 'I11', 'Vacaciones', '2025-08-04', '2025-08-10', 7, 'aprobado', 'María Zoé Natera', 'Una semana de viaje, los devs nos ausentamos.', '07.07.2025'),
  ('lr_I11_3', 'I11', 'Extra Day', '2025-11-17', '2025-11-17', 1, 'aprobado', 'María Zoé Natera', 'Viaje a Córdoba para una consulta médica', '11.11.2025'),
  ('lr_I11_4', 'I11', 'Extra Day', '2025-12-17', '2025-12-17', 1, 'aprobado', 'María Zoé Natera', 'Me surgio un viaje a Rosario', '15.12.2025'),
  ('lr_I11_5', 'I11', 'Vacaciones', '2026-02-18', '2026-03-01', 12, 'aprobado', 'María Zoé Natera', 'Dias de descanso', '19.01.2026'),
  ('lr_I11_6', 'I11', 'Extra Day', '2026-06-05', '2026-06-05', 1, 'aprobado', 'María Zoé Natera', 'Descanso', '03.06.2026'),
  ('lr_I11_7', 'I11', 'Mudanza', '2026-06-29', '2026-06-29', 1, 'aprobado', 'María Zoé Natera', '', '01.07.2026'),
  ('lr_I11_8', 'I11', 'Extra Day', '2026-08-14', '2026-08-14', 1, 'aprobado', 'María Zoé Natera', 'Salgo de viaje', '03.08.2026'),
  ('lr_I31_0', 'I31', 'Extra Day', '2025-12-16', '2025-12-16', 1, 'aprobado', 'María Zoé Natera', '', '11.12.2025'),
  ('lr_I31_1', 'I31', 'Cumpleaños', '2026-02-09', '2026-02-09', 1, 'aprobado', '—', '', ''),
  ('lr_I31_2', 'I31', 'Extra Day', '2026-04-29', '2026-04-29', 1, 'aprobado', 'Diego Alvarez', '', '28.04.2026'),
  ('lr_I31_3', 'I31', 'Extra Day', '2026-05-22', '2026-05-22', 1, 'aprobado', 'María Zoé Natera', 'Buen día!! tengo acto de colación en la universidad de mi hermano!', '18.05.2026'),
  ('lr_I31_4', 'I31', 'Extra Day', '2026-07-31', '2026-07-31', 1, 'aprobado', 'María Zoé Natera', 'Cumple de Mercedes 2 años', '24.07.2026'),
  ('lr_I31_5', 'I31', 'Vacaciones', '2026-08-31', '2026-09-08', 9, 'aprobado', 'María Zoé Natera', 'Vacaciones', '06.08.2026'),
  ('lr_E13_0', 'E13', 'Vacaciones', '2024-12-09', '2024-12-22', 14, 'aprobado', 'María Zoé Natera', '', '20.11.2024'),
  ('lr_E13_1', 'E13', 'Final Days', '2025-02-25', '2025-02-25', 1, 'aprobado', 'María Zoé Natera', 'Ya coordinamos con el equipo para cubrir mi ausencia.', '17.02.2025'),
  ('lr_E13_2', 'E13', 'Extra Day', '2025-04-07', '2025-04-07', 1, 'aprobado', 'María Zoé Natera', '', '26.03.2025'),
  ('lr_E13_3', 'E13', 'Extra Day', '2025-05-28', '2025-05-28', 1, 'aprobado', 'María Zoé Natera', 'Buenas team!
Ya coordiné tomarme este flex day con mi equipo, aprovecho porque rindo un parcial ese día.

Quedo atenta,
Saludos!', '26.05.2025'),
  ('lr_E13_4', 'E13', 'Extra Day', '2025-06-30', '2025-06-30', 1, 'aprobado', 'María Zoé Natera', 'Ya dialogado y coordinado con el resto de mi equipo.

Gracias!', '10.06.2025'),
  ('lr_E13_5', 'E13', 'Vacaciones', '2025-07-14', '2025-07-17', 4, 'aprobado', 'María Zoé Natera', 'Hola equipo!

Solicito estos días de vacaciones, ya dialogado con Meli.

Saludos.', '23.06.2025'),
  ('lr_E13_6', 'E13', 'Cumpleaños', '2025-08-22', '2025-08-22', 1, 'aprobado', '—', '', ''),
  ('lr_E13_7', 'E13', 'Extra Day', '2025-11-07', '2025-11-07', 1, 'aprobado', 'María Zoé Natera', 'Aprobado por Meli.', '29.10.2025'),
  ('lr_E13_8', 'E13', 'Extra Day', '2025-12-02', '2025-12-02', 1, 'aprobado', 'María Zoé Natera', 'Aprobado por Meli', '29.10.2025'),
  ('lr_E13_9', 'E13', 'Vacaciones', '2026-01-12', '2026-01-25', 14, 'aprobado', 'María Zoé Natera', 'Corrección de fechas dialogado con Zoé', '22.12.2025'),
  ('lr_E13_10', 'E13', 'Extra Day', '2026-05-22', '2026-05-22', 1, 'aprobado', 'Melisa Soledad Diaz Gonzalez', '', '18.05.2026'),
  ('lr_I5_0', 'I5', 'Enfermedad', '2025-02-07', '2025-02-07', 1, 'aprobado', 'María Zoé Natera', 'Inicio de bronquitis, hermosa noche de fiebre y tos.', '13.02.2025'),
  ('lr_I5_1', 'I5', 'Vacaciones', '2025-02-17', '2025-03-04', 16, 'aprobado', 'María Zoé Natera', 'Equipo, solicito mis vacaciones desde el día 17-02-25 hasta el dia 04-03-25, reincorporandome el dia 05-03-25. 
Ya fue coordinado con mi lider y equipo! 
Saludos', '30.01.2025'),
  ('lr_I5_2', 'I5', 'Vacaciones', '2025-07-14', '2025-07-20', 7, 'aprobado', 'María Zoé Natera', 'Vacaciones, previo nacimiento de Helena.', '24.06.2025'),
  ('lr_I5_3', 'I5', 'Extra Day', '2025-11-27', '2025-11-27', 1, 'aprobado', 'María Zoé Natera', 'Cuidado de Helena.', '25.11.2025'),
  ('lr_I5_4', 'I5', 'Extra Day', '2026-02-03', '2026-02-03', 1, 'aprobado', 'María Zoé Natera', '', '26.01.2026'),
  ('lr_I5_5', 'I5', 'Mudanza', '2026-02-12', '2026-02-13', 2, 'aprobado', 'María Zoé Natera', 'Mudanza a mi hogar!!!', '11.02.2026'),
  ('lr_I5_6', 'I5', 'Extra Day', '2026-07-13', '2026-07-13', 1, 'aprobado', 'María Zoé Natera', '', '10.07.2026'),
  ('lr_I5_7', 'I5', 'Extra Day', '2026-09-10', '2026-09-10', 1, 'aprobado', 'María Zoé Natera', 'Helena cumple su primer añito.', '31.08.2026'),
  ('lr_I6_0', 'I6', 'Vacaciones', '2025-01-06', '2025-01-19', 14, 'aprobado', 'María Zoé Natera', 'Reincorporacion el dia 20-ene. Ok del lider', '13.01.2025'),
  ('lr_I6_1', 'I6', 'Vacaciones', '2025-02-17', '2025-03-04', 16, 'aprobado', 'María Zoé Natera', 'Reincorporacion el dia 04-mar. Ok del lider', '13.01.2025'),
  ('lr_I6_2', 'I6', 'Vacaciones', '2026-02-02', '2026-02-15', 14, 'aprobado', 'María Zoé Natera', 'Hola Team, buenas tardes. Solicito vacaciones desde el 2 de febrero al 15 de febrero inclusive. Adicionalmente el día 16 y 17 de febrero es festivo en Argentina, por lo cual, me reincorporo el miércol', '19.01.2026'),
  ('lr_I6_3', 'I6', 'Vacaciones', '2026-02-16', '2026-02-17', 2, 'aprobado', 'María Zoé Natera', 'Actualizado x carnaval', '19.01.2026'),
  ('lr_I6_4', 'I6', 'Vacaciones', '2026-04-06', '2026-04-12', 7, 'aprobado', 'María Zoé Natera', 'Hola Team, buenos días. 

Genero esta solicitud, desde el 6 de abril hasta el 12 de abril incluido para re-incorporarme el 7 de abril. 
Dialogué con Juancho y el equipo, previamente para notificarl', '25.03.2026'),
  ('lr_E10_0', 'E10', 'Vacaciones', '2024-12-23', '2024-12-29', 7, 'aprobado', 'María Zoé Natera', '', '09.12.2024'),
  ('lr_E10_1', 'E10', 'Vacaciones', '2025-01-08', '2025-01-12', 5, 'aprobado', 'María Zoé Natera', 'Regreso el dia 13 de enero. Confirmado por mi lider', '19.12.2024'),
  ('lr_E10_2', 'E10', 'Extra Day', '2025-04-22', '2025-04-22', 1, 'aprobado', 'María Zoé Natera', 'Equipo, solicitó tomarme un Extra Day el día 22-04-2025.
Ya fue coordinado con mi líder y equipo!
Saludos', '11.04.2025'),
  ('lr_E10_3', 'E10', 'Extra Day', '2025-06-11', '2025-06-11', 1, 'aprobado', 'María Zoé Natera', 'Extra day solicitado :D', '10.06.2025'),
  ('lr_E10_4', 'E10', 'Cumpleaños', '2025-10-23', '2025-10-23', 1, 'aprobado', '—', 'Día de cumpleaños solicitado y conversado con Meli', ''),
  ('lr_E10_5', 'E10', 'Extra Day', '2025-11-12', '2025-11-12', 1, 'aprobado', 'María Zoé Natera', 'Solicitud enviada por email y aprobada', '03.11.2025'),
  ('lr_E10_6', 'E10', 'Vacaciones', '2025-12-29', '2025-12-31', 3, 'aprobado', 'María Zoé Natera', 'Solicitud realizada por email y aprobada', '03.11.2025'),
  ('lr_E10_7', 'E10', 'Vacaciones', '2026-01-01', '2026-01-04', 4, 'aprobado', 'María Zoé Natera', 'Solicitud realizada por email y aprobada', '03.11.2025'),
  ('lr_I9_0', 'I9', 'Vacaciones', '2025-02-27', '2025-03-04', 6, 'aprobado', 'María Zoé Natera', 'Me reincorporo el miércoles 5', '24.02.2025'),
  ('lr_I9_1', 'I9', 'Vacaciones', '2025-08-04', '2025-08-08', 5, 'aprobado', 'María Zoé Natera', 'Vacaciones', '24.06.2025'),
  ('lr_I9_2', 'I9', 'Cumpleaños', '2025-08-18', '2025-08-18', 1, 'aprobado', '—', '', ''),
  ('lr_I9_3', 'I9', 'Vacaciones', '2025-10-09', '2025-10-19', 11, 'aprobado', 'María Zoé Natera', 'Vacaciones', '30.05.2025'),
  ('lr_I9_4', 'I9', 'Vacaciones', '2026-08-31', '2026-09-04', 5, 'aprobado', 'María Zoé Natera', 'Tiempo fuera', '18.08.2026'),
  ('lr_I9_5', 'I9', 'Vacaciones', '2026-09-26', '2026-10-17', 22, 'aprobado', 'Diego Alvarez', 'Vacaciones', '04.12.2025'),
  ('lr_A6_0', 'A6', 'Vacaciones', '2026-02-09', '2026-02-15', 7, 'aprobado', 'María Zoé Natera', 'Asentado x correo', '09.02.2026'),
  ('lr_E27_0', 'E27', 'Extra Day', '2024-12-13', '2024-12-13', 1, 'aprobado', 'María Zoé Natera', '', '30.01.2025'),
  ('lr_E27_1', 'E27', 'Cumpleaños', '2025-04-25', '2025-04-25', 1, 'aprobado', '—', '', ''),
  ('lr_E27_2', 'E27', 'Extra Day', '2025-07-04', '2025-07-04', 1, 'aprobado', 'María Zoé Natera', '', '01.07.2025'),
  ('lr_E27_3', 'E27', 'Vacaciones', '2025-07-14', '2025-07-20', 7, 'aprobado', 'María Zoé Natera', 'Equipo, solicito mis vacaciones desde el día 14-07-2025 hasta el dia 20-07-2025, reincorporandome el dia 21-07-2025. 
Ya fue coordinado con mi líder y equipo! 
Saludos', '05.05.2025'),
  ('lr_E27_4', 'E27', 'Vacaciones', '2025-08-04', '2025-08-10', 7, 'aprobado', 'María Zoé Natera', 'Vacaciones Bariloche', '15.08.2025'),
  ('lr_E27_5', 'E27', 'Extra Day', '2025-12-15', '2025-12-15', 1, 'aprobado', 'María Zoé Natera', '', '09.12.2025'),
  ('lr_E27_6', 'E27', 'Extra Day', '2026-03-13', '2026-03-13', 1, 'aprobado', 'María Zoé Natera', 'Solicitud por varios turnos médicos', '10.03.2026'),
  ('lr_E27_7', 'E27', 'Extra Day', '2026-05-15', '2026-05-15', 1, 'aprobado', 'María Zoé Natera', 'Solicitado por análisis médicos', '05.05.2026'),
  ('lr_E27_8', 'E27', 'Vacaciones', '2026-07-06', '2026-07-12', 7, 'aprobado', 'María Zoé Natera', 'solicitud de vacaciones', '16.06.2026'),
  ('lr_E27_9', 'E27', 'Vacaciones', '2026-07-30', '2026-08-02', 4, 'aprobado', 'María Zoé Natera', 'Viaje sky', '16.06.2026'),
  ('lr_E27_10', 'E27', 'Extra Day', '2026-10-08', '2026-10-08', 1, 'aprobado', 'Camila Calcagno', '', '05.10.2026'),
  ('lr_I14_0', 'I14', 'Extra Day', '2025-02-14', '2025-02-14', 1, 'aprobado', 'María Zoé Natera', 'Equipo, solicito tomarme un Extra Day el día 14-02-2025.
Ya fue coordinado con mi líder y equipo!
Saludos', '10.02.2025'),
  ('lr_I14_1', 'I14', 'Vacaciones', '2025-03-25', '2025-04-16', 23, 'aprobado', 'María Zoé Natera', 'Equipo, solicito mis vacaciones desde el día 2025-03-25 hasta el día 2025-04-16, reincorporándome el día  2025-04-17. 
Ya fue coordinado con mi líder y equipo! 
Saludos', '31.01.2025'),
  ('lr_I14_2', 'I14', 'Cumpleaños', '2025-05-23', '2025-05-23', 1, 'aprobado', '—', 'Buenas, me voy a tomar el día viernes por mi cumpleaños.
Ya le informé a mi superior y quien pueda depender de mi.', ''),
  ('lr_I14_3', 'I14', 'Vacaciones', '2026-03-02', '2026-03-15', 14, 'aprobado', 'María Zoé Natera', 'Buenas, solicito vacaciones del 2 al 15 de marzo inclusive.', '19.01.2026'),
  ('lr_I14_4', 'I14', 'Cumpleaños', '2026-05-05', '2026-05-05', 1, 'aprobado', '—', '', ''),
  ('lr_I14_5', 'I14', 'Extra Day', '2026-07-31', '2026-07-31', 1, 'aprobado', 'María Zoé Natera', 'Solicito extra day el día 31 de Julio', '23.07.2026'),
  ('lr_I14_6', 'I14', 'Mudanza', '2026-09-25', '2026-09-25', 1, 'aprobado', 'María Zoé Natera', 'Voy a estar con mudanza, ya lo hablé con Germán por si acaso.', '21.09.2026'),
  ('lr_I10_0', 'I10', 'Extra Day', '2024-11-01', '2024-11-01', 1, 'aprobado', 'María Zoé Natera', '', '22.10.2024'),
  ('lr_I10_1', 'I10', 'Extra Day', '2025-02-13', '2025-02-13', 1, 'aprobado', 'María Zoé Natera', '', '05.02.2025'),
  ('lr_I10_2', 'I10', 'Cumpleaños', '2025-02-21', '2025-02-21', 1, 'aprobado', '—', '', ''),
  ('lr_I10_3', 'I10', 'Vacaciones', '2025-03-05', '2025-03-24', 20, 'aprobado', 'María Zoé Natera', '"Equipo, solicito mis vacaciones desde el día 05-mar-25 hasta el dia 24-mar-25, reincorporandome el dia 25-mar-25. 
Ya fue coordinado con mi lider y equipo! 
Saludos"', '31.01.2025'),
  ('lr_I10_4', 'I10', 'Extra Day', '2025-05-15', '2025-05-15', 1, 'aprobado', 'María Zoé Natera', '', '07.05.2025'),
  ('lr_I10_5', 'I10', 'Extra Day', '2025-07-28', '2025-07-28', 1, 'aprobado', 'María Zoé Natera', '', '07.07.2025'),
  ('lr_I10_6', 'I10', 'Vacaciones', '2025-08-04', '2025-08-10', 7, 'aprobado', 'María Zoé Natera', '⛷️', '04.07.2025'),
  ('lr_I10_7', 'I10', 'Extra Day', '2025-10-24', '2025-10-24', 1, 'aprobado', 'María Zoé Natera', '', '17.10.2025'),
  ('lr_I10_8', 'I10', 'Extra Day', '2025-12-22', '2025-12-22', 1, 'aprobado', 'María Zoé Natera', '', '03.12.2025'),
  ('lr_I10_9', 'I10', 'Cumpleaños', '2026-02-19', '2026-02-19', 1, 'aprobado', '—', '', ''),
  ('lr_I10_10', 'I10', 'Vacaciones', '2026-02-23', '2026-03-01', 7, 'aprobado', 'María Zoé Natera', 'Vacaciones', '06.01.2026'),
  ('lr_I10_11', 'I10', 'Extra Day', '2026-05-08', '2026-05-08', 1, 'aprobado', 'María Zoé Natera', '', '22.04.2026'),
  ('lr_I10_12', 'I10', 'Extra Day', '2026-06-22', '2026-06-22', 1, 'aprobado', 'María Zoé Natera', '', '03.06.2026'),
  ('lr_I10_13', 'I10', 'Vacaciones', '2026-07-29', '2026-08-02', 5, 'aprobado', 'María Zoé Natera', 'Esqui', '03.06.2026'),
  ('lr_I10_14', 'I10', 'Extra Day', '2026-08-28', '2026-08-28', 1, 'aprobado', 'María Zoé Natera', '', '03.06.2026'),
  ('lr_I10_15', 'I10', 'Mudanza', '2026-09-24', '2026-09-24', 1, 'aprobado', 'María Zoé Natera', '', '18.09.2026'),
  ('lr_I10_16', 'I10', 'Mudanza', '2026-09-29', '2026-09-29', 1, 'aprobado', 'María Zoé Natera', '', '17.09.2026'),
  ('lr_I10_17', 'I10', 'Vacaciones', '2026-11-24', '2026-11-29', 6, 'aprobado', 'María Zoé Natera', 'Vacaciones', '13.05.2026'),
  ('lr_I10_18', 'I10', 'Vacaciones', '2026-11-30', '2026-12-06', 7, 'aprobado', 'María Zoé Natera', 'Extiendo 1 semana de vacaciones para utilización de días disponibles a vencer en 2026', '12.08.2026'),
  ('lr_E37_0', 'E37', 'Extra Day', '2025-01-24', '2025-01-24', 1, 'aprobado', 'Georgina Zunino', '', '21.01.2025'),
  ('lr_E37_1', 'E37', 'Vacaciones', '2025-04-14', '2025-04-27', 14, 'aprobado', 'María Zoé Natera', 'Equipo, solicito mis vacaciones desde el día 14 de abril hasta el dia 27 de abril, reincorporandome el dia 28 de abril.

Ya fue coordinado con mi lider y equipo! 

Saludos', '06.03.2025'),
  ('lr_E37_2', 'E37', 'Cumpleaños', '2025-05-21', '2025-05-21', 1, 'aprobado', '—', 'Hola:
Es para tomarme el día de mi cumpleaños, ya lo hablé con Diego.

Saludos.', ''),
  ('lr_E37_3', 'E37', 'Extra Day', '2025-06-24', '2025-06-24', 1, 'aprobado', 'María Zoé Natera', 'Ya lo conversé Con Diego quien dio el visto bueno.

Saludos.', '23.06.2025'),
  ('lr_E37_4', 'E37', 'Vacaciones', '2025-08-08', '2025-08-08', 1, 'aprobado', 'María Zoé Natera', 'Informé al equipo.', '06.08.2025'),
  ('lr_E37_5', 'E37', 'Vacaciones', '2025-08-25', '2025-08-29', 5, 'aprobado', 'María Zoé Natera', 'Fue dialogada con Diego.', '28.07.2025'),
  ('lr_E37_6', 'E37', 'Extra Day', '2025-11-27', '2025-11-27', 1, 'aprobado', 'María Zoé Natera', '', '20.11.2025'),
  ('lr_E37_7', 'E37', 'Vacaciones', '2026-01-19', '2026-01-30', 10, 'aprobado', 'Alejandra Gregoris', 'Días de vacaciones', '29.12.2025'),
  ('lr_E37_8', 'E37', 'Mudanza', '2026-03-20', '2026-03-20', 1, 'aprobado', 'María Zoé Natera', 'Dialogado con Diego', '20.03.2026'),
  ('lr_E37_9', 'E37', 'Mudanza', '2026-03-24', '2026-03-24', 1, 'aprobado', 'María Zoé Natera', 'Solicitud de mudanza', '20.03.2026'),
  ('lr_E37_10', 'E37', 'Licencia Especial', '2026-04-20', '2026-04-25', 5, 'aprobado', 'María Zoé Natera', 'Conversado con el equipo. Licencia por Calamidad Doméstica (pendiente presentar documentación pertinente)', '20.04.2026'),
  ('lr_E37_11', 'E37', 'Cumpleaños', '2026-05-25', '2026-05-25', 1, 'aprobado', '—', '', ''),
  ('lr_E37_12', 'E37', 'Enfermedad', '2026-06-18', '2026-06-18', 1, 'aprobado', 'María Zoé Natera', 'Solicito 1 días (pasado).
No adjunto Cetificado médico ya que no fui a la guardia porque la verdad no se si me llegaban a atender y me hubiese tocado estar voltiando todo el día y probablemente llega', '19.06.2026'),
  ('lr_E37_13', 'E37', 'Vacaciones', '2026-06-30', '2026-07-03', 4, 'aprobado', 'María Zoé Natera', 'Solicitud de vacaciones.', '08.06.2026'),
  ('lr_E37_14', 'E37', 'Extra Day', '2026-10-05', '2026-10-05', 1, 'aprobado', 'Georgina Zunino', '', '02.10.2026'),
  ('lr_I20_0', 'I20', 'Vacaciones', '2024-11-11', '2024-11-17', 7, 'aprobado', 'María Zoé Natera', '', '10.12.2024'),
  ('lr_I20_1', 'I20', 'Extra Day', '2025-04-25', '2025-04-25', 1, 'aprobado', 'María Zoé Natera', '', '22.04.2025'),
  ('lr_I20_2', 'I20', 'Extra Day', '2025-07-04', '2025-07-04', 1, 'aprobado', 'María Zoé Natera', '', '01.07.2025'),
  ('lr_I20_3', 'I20', 'Vacaciones', '2025-07-14', '2025-07-27', 14, 'aprobado', 'María Zoé Natera', 'Solicito vacaciones para descansar :)', '26.06.2025'),
  ('lr_I20_4', 'I20', 'Mudanza', '2025-11-21', '2025-11-21', 1, 'aprobado', 'María Zoé Natera', '', '11.11.2025'),
  ('lr_I20_5', 'I20', 'Extra Day', '2025-12-15', '2025-12-15', 1, 'aprobado', 'María Zoé Natera', '', '01.12.2025'),
  ('lr_I20_6', 'I20', 'Vacaciones', '2026-02-02', '2026-02-17', 16, 'aprobado', 'María Zoé Natera', 'Solicito nuevamente por el feriado', '15.01.2026'),
  ('lr_I20_7', 'I20', 'Extra Day', '2026-05-08', '2026-05-08', 1, 'aprobado', 'María Zoé Natera', '', '04.05.2026'),
  ('lr_I20_8', 'I20', 'Extra Day', '2026-08-28', '2026-08-28', 1, 'aprobado', 'María Zoé Natera', 'Tengo que hacerme un fondo de ojo', '26.08.2026'),
  ('lr_I20_9', 'I20', 'Extra Day', '2026-09-18', '2026-09-18', 1, 'aprobado', 'María Zoé Natera', 'Turno medico y tramites personales', '14.09.2026'),
  ('lr_I20_10', 'I20', 'Extra Day', '2026-10-19', '2026-10-19', 1, 'pendiente', 'Diego Alvarez En fila', '', ''),
  ('lr_E17_0', 'E17', 'Extra Day', '2024-11-01', '2024-11-01', 1, 'aprobado', 'María Zoé Natera', '', '16.10.2024'),
  ('lr_E17_1', 'E17', 'Extra Day', '2025-01-24', '2025-01-24', 1, 'aprobado', 'Georgina Zunino', 'Coordinado con lider y equipo', '21.01.2025'),
  ('lr_E17_2', 'E17', 'Vacaciones', '2025-03-05', '2025-03-10', 6, 'aprobado', 'María Zoé Natera', 'Se reincorpora a sus actividades el dia 11-mar. Ya coordinado con lider y equipo', '31.01.2025'),
  ('lr_E17_3', 'E17', 'Extra Day', '2025-05-30', '2025-05-30', 1, 'aprobado', 'Georgina Zunino', '', '08.07.2025'),
  ('lr_E17_4', 'E17', 'Extra Day', '2025-07-18', '2025-07-18', 1, 'aprobado', 'María Zoé Natera', 'El día fue previamente coordinado con el líder y equipo', '14.07.2025'),
  ('lr_E17_5', 'E17', 'Cumpleaños', '2025-11-07', '2025-11-07', 1, 'aprobado', '—', '', ''),
  ('lr_E17_6', 'E17', 'Extra Day', '2025-12-19', '2025-12-19', 1, 'aprobado', 'María Zoé Natera', '', '10.12.2025'),
  ('lr_E17_7', 'E17', 'Vacaciones', '2026-04-06', '2026-04-19', 14, 'aprobado', 'María Zoé Natera', 'Viaje / Vacaciones', '19.01.2026'),
  ('lr_E17_8', 'E17', 'Extra Day', '2026-06-02', '2026-06-02', 1, 'aprobado', 'María Zoé Natera', '', '22.05.2026'),
  ('lr_E17_9', 'E17', 'Extra Day', '2026-07-27', '2026-07-27', 1, 'aprobado', 'María Zoé Natera', '', '13.07.2026'),
  ('lr_E17_10', 'E17', 'Extra Day', '2026-10-30', '2026-10-30', 1, 'aprobado', 'Natalia Maffini', '', '12.10.2026'),
  ('lr_I17_0', 'I17', 'Vacaciones', '2025-03-31', '2025-04-20', 21, 'aprobado', 'María Zoé Natera', 'Ajuste', '10.04.2025'),
  ('lr_I17_1', 'I17', 'Extra Day', '2025-09-26', '2025-09-26', 1, 'aprobado', 'María Zoé Natera', 'Ya coordinado', '25.09.2025'),
  ('lr_I17_2', 'I17', 'Vacaciones', '2026-01-19', '2026-02-01', 14, 'aprobado', 'María Zoé Natera', 'Vacaciones Georgi.', '09.01.2026'),
  ('lr_E2_0', 'E2', 'Extra Day', '2025-01-24', '2025-01-24', 1, 'aprobado', 'Georgina Zunino', '', '21.01.2025'),
  ('lr_E2_1', 'E2', 'Vacaciones', '2025-03-25', '2025-04-06', 13, 'aprobado', 'María Zoé Natera', 'Equipo, solicito mis vacaciones desde el día 25/03/2025 (Considerando que el 24/03 es feriado) hasta el día 06/04/2025, reincorporandome el dia Lunes 07/04/2025.
Ya fue coordinado con mi lider y equi', '03.02.2025'),
  ('lr_E2_2', 'E2', 'Extra Day', '2025-06-13', '2025-06-13', 1, 'aprobado', 'María Zoé Natera', 'Zoé, de acuerdo a lo dialogado, el dia viernes tengo que viajar a Marco Juarez a buscar a mi papá, él trabaja allá durante la semana y no tiene cómo volver. Ya lo charlé con Diego y me indicó que no h', '10.06.2025'),
  ('lr_E2_3', 'E2', 'Cumpleaños', '2025-08-01', '2025-08-01', 1, 'aprobado', '—', 'Solicito el día de mi cumpleañitos para el viernes 1ro de Agosto, la idea es aprovechar el día y el hecho de que ese dia salimos de viaje con el equipo.

Saludos!', ''),
  ('lr_E2_4', 'E2', 'Vacaciones', '2025-08-04', '2025-08-10', 7, 'aprobado', 'María Zoé Natera', 'Equipo, solicito mis vacaciones desde el día 4 De agosto de 2025 hasta el dia 10 de agosto del corriente, reincorporandome el dia lunes 11 de agosto. 
Ya fue coordinado con mi lider y equipo! 
Salud', '08.07.2025'),
  ('lr_E2_5', 'E2', 'Extra Day', '2025-10-13', '2025-10-14', 1, 'aprobado', 'María Zoé Natera', 'Equipo, solicito tomarme un Extra Day el día 13/10/25.
Fue coordinado con mi lider para reincorporarme al 100% luego del viaje.
Saludos!', '13.10.2025'),
  ('lr_E2_6', 'E2', 'Vacaciones', '2026-01-05', '2026-01-18', 14, 'aprobado', 'María Zoé Natera', 'Equipo, solicito mis vacaciones desde el día 05-01-2026 hasta el dia 18-01-2026, reincorporandome el dia 19-01-2026.
Ya fue coordinado con mi lider y equipo!
Saludos', '20.11.2025'),
  ('lr_E2_7', 'E2', 'Mudanza', '2026-03-19', '2026-03-20', 2, 'aprobado', 'María Zoé Natera', 'Equipo, buenas tardes! estoy en proceso de mudanza, y luego de pasar el finde moviendo algunas cosas, quedan algunos viajes por hacer y el acondicionamiento del depto a dejar (lijado, pintura y demás)', '16.03.2026'),
  ('lr_E2_8', 'E2', 'Cumpleaños', '2026-07-29', '2026-07-29', 1, 'aprobado', '—', 'HB to me', ''),
  ('lr_E2_9', 'E2', 'Vacaciones', '2026-07-30', '2026-08-02', 4, 'aprobado', 'María Zoé Natera', 'Equipo, solicito mis vacaciones desde el día 30/07/2026 hasta el dia 02/07/2026, reincorporandome el dia 03/08/2026. 
Ya fue coordinado con mi lider y equipo! 
Saludos', '17.07.2026'),
  ('lr_E2_10', 'E2', 'Extra Day', '2026-10-02', '2026-10-02', 1, 'aprobado', 'Georgina Zunino', 'Equipo, solicito extra day para aprovechar la estabilidad que venimos teniendo con los proyectos. Pongo a Cami al dia para que me cubra en lo que pueda hacer falta de mi lado', '28.09.2026'),
  ('lr_I4_0', 'I4', 'Extra Day', '2025-06-30', '2025-06-30', 1, 'aprobado', 'María Zoé Natera', 'Por razones particulares solicito extra day el día lunes 30/06/2025.
Gracias!', '27.06.2025'),
  ('lr_I4_1', 'I4', 'Vacaciones', '2025-07-23', '2025-07-31', 9, 'aprobado', 'María Zoé Natera', 'Equipo, solicito mis vacaciones desde el día 23/07/2025 hasta el dia 31/07/2025, reincorporandome el día 1º/08/2025. 
Ya fue coordinado con mi líder y equipo! 
Saludos.', '21.07.2025'),
  ('lr_I4_2', 'I4', 'Cumpleaños', '2025-08-18', '2025-08-18', 1, 'aprobado', '—', 'Solicito día libre por mi cumpleaños el domingo 17.. reincorporandomé el martes 19 de agosto de 2025. Gracias!', ''),
  ('lr_I4_3', 'I4', 'Vacaciones', '2026-01-05', '2026-01-25', 21, 'aprobado', 'María Zoé Natera', 'Solicito 21 días de Vacaciones.

Gracias Zoé y Georgi!', '22.12.2025'),
  ('lr_I4_4', 'I4', 'Extra Day', '2026-05-29', '2026-05-29', 1, 'aprobado', 'María Zoé Natera', 'Solicito Extra Day por razones particulares.
Sé que en realidad ni te importa porque no vengo.. pero bueno, te aviso para cumplir.', '28.05.2026'),
  ('lr_I4_5', 'I4', 'Vacaciones', '2026-07-13', '2026-07-17', 5, 'aprobado', 'María Zoé Natera', 'Solicito desde el 13 al 17 de julio de 2026.', '19.06.2026'),
  ('lr_I4_6', 'I4', 'Cumpleaños', '2026-08-21', '2026-08-21', 1, 'aprobado', '—', '', ''),
  ('lr_I4_7', 'I4', 'Cumpleaños', '2026-08-24', '2026-08-24', 1, 'aprobado', '—', '', ''),
  ('lr_E14_0', 'E14', 'Extra Day', '2025-01-27', '2025-01-27', 1, 'aprobado', 'Georgina Zunino', '', '23.01.2025'),
  ('lr_E14_1', 'E14', 'Extra Day', '2025-02-24', '2025-02-24', 1, 'aprobado', 'María Zoé Natera', '', '17.02.2025'),
  ('lr_E14_2', 'E14', 'Enfermedad', '2025-04-14', '2025-04-14', 1, 'aprobado', 'María Zoé Natera', 'Equipo, 
Solicito día para extracción de muelas de Juicio. 
Quedo atenta a sus comentarios.
Muchas gracias!
Saludos,', '07.04.2025'),
  ('lr_E14_3', 'E14', 'Extra Day', '2025-10-31', '2025-10-31', 1, 'aprobado', 'María Zoé Natera', 'Viaje a Buenos Aires', '22.10.2025'),
  ('lr_E14_4', 'E14', 'Cumpleaños', '2025-11-14', '2025-11-14', 1, 'aprobado', '—', 'Buen día equipo!
Envio solicitud para hacer uso del benficio del día de cumpleaños.
Cualquier duda, me avisan.
Saludos,', ''),
  ('lr_E14_5', 'E14', 'Extra Day', '2025-12-04', '2025-12-04', 1, 'aprobado', 'María Zoé Natera', 'Equipo,
Solicito el día Jueves 4 de Diciembre para viajar a realizar el tramite de la Visa de USA. 
Quedo atenta a sus comentarios.
Muchas gracias!
Saludos,', '26.11.2025'),
  ('lr_E14_6', 'E14', 'Extra Day', '2026-01-16', '2026-01-16', 1, 'aprobado', 'María Zoé Natera', '', '08.01.2026'),
  ('lr_E14_7', 'E14', 'Extra Day', '2026-05-29', '2026-05-29', 1, 'aprobado', 'Marcelo Sosa', 'Equipo,
Solicito extra day para el día viernes 29 de Mayo.
Quedo atenta a su confirmación.
Muchas gracias.
Saludos,', '27.05.2026'),
  ('lr_E14_8', 'E14', 'Vacaciones', '2026-06-18', '2026-06-28', 11, 'aprobado', 'María Zoé Natera', 'Hola equipo, 
Tal lo conversado con Zoé, vuelvo a retomar el pedido de días de vacaciones desde el día 18.
Me dejan saber cualquier duda.
Muchas gracias!', '26.05.2026'),
  ('lr_E14_9', 'E14', 'Extra Day', '2026-08-03', '2026-08-03', 1, 'aprobado', 'María Zoé Natera', 'Hola equipo,

Solicito extra day para el día Lunes 03 de Agosto, ya coordine con Chelo.

Saludos,', '31.07.2026'),
  ('lr_E14_10', 'E14', 'Vacaciones', '2026-09-03', '2026-09-08', 6, 'aprobado', 'María Zoé Natera', 'Hola equipo, 
Solicito vacaciones tal lo conversado con Chelo el día Viernes 07 de Agosto.
Quedo atenta, cualquier duda!
Saludos,', '18.08.2026'),
  ('lr_E14_11', 'E14', 'Enfermedad', '2026-09-17', '2026-09-18', 2, 'aprobado', 'María Zoé Natera', 'Equipo,
Adjunto certificado medico por cirugia. 
Cualquier duda, me avisan.
Saludos,', '15.09.2026'),
  ('lr_E42_0', 'E42', 'Extra Day', '2025-09-19', '2025-09-19', 1, 'aprobado', 'María Zoé Natera', 'Viajo a Embalse el fin de semana. Con Fede ya organicé mis reuniones y tareas para avanzarlas en la semana.', '18.09.2025'),
  ('lr_E42_1', 'E42', 'Extra Day', '2025-11-18', '2025-11-18', 1, 'aprobado', 'María Zoé Natera', 'Tengo que rendir un parcial en la universidad desde las 16hs hasta las 19hs. Ya conversé y organicé mis tareas con Federico Franco.', '20.11.2025'),
  ('lr_E42_2', 'E42', 'Final Days', '2025-11-25', '2025-11-25', 1, 'aprobado', 'María Zoé Natera', 'Coordinado', '25.11.2025'),
  ('lr_E42_3', 'E42', 'Cumpleaños', '2025-11-28', '2025-11-28', 1, 'aprobado', '—', 'Tengo que rendir un parcial en la universidad. Ya organicé mis tareas con Fede.', ''),
  ('lr_E42_4', 'E42', 'Vacaciones', '2026-02-03', '2026-02-17', 15, 'aprobado', 'María Zoé Natera', 'Ya conversado con Zoé, debido a una modificacion en el viaje, tuve que cambiar las fechas. Coordinado con el equipo', '30.01.2026'),
  ('lr_E42_5', 'E42', 'Enfermedad', '2026-04-10', '2026-04-10', 1, 'aprobado', 'María Zoé Natera', 'Tengo turno con el dentista para extracción de las muelas de juicio. Ya conversé con Fede y organicé mis tareas!', '08.04.2026'),
  ('lr_E42_6', 'E42', 'Final Days', '2026-05-15', '2026-05-15', 1, 'aprobado', 'María Zoé Natera', 'Tengo que rendir un parcial en la universidad. Ya conversé con Fede y organicé mis tareas del día.', '14.05.2026'),
  ('lr_E42_7', 'E42', 'Final Days', '2026-06-08', '2026-06-08', 1, 'aprobado', 'María Zoé Natera', 'Tengo que rendir parciales en la universidad. Ya conversé con Fede y organicé mis tareas.', '08.06.2026'),
  ('lr_E42_8', 'E42', 'Final Days', '2026-06-12', '2026-06-12', 1, 'aprobado', 'María Zoé Natera', 'Tengo que rendir parciales en la universidad. Ya conversé con Fede y organicé mis tareas.', '08.06.2026'),
  ('lr_E42_9', 'E42', 'Final Days', '2026-06-30', '2026-06-30', 1, 'aprobado', 'María Zoé Natera', 'El día martes 30 de junio tengo que rendir un examen final en la universidad. Ya coordiné con el equipo y dejaré adelantadas mis tareas del día.', '26.06.2026'),
  ('lr_E42_10', 'E42', 'Extra Day', '2026-07-20', '2026-07-20', 1, 'aprobado', 'María Zoé Natera', 'Equipo, solicito tomarme un Extra Day el día lunes 20 de julio. Ya fue coordinado con mi lider y equipo! Saludos.', '17.07.2026'),
  ('lr_E42_11', 'E42', 'Final Days', '2026-08-04', '2026-08-04', 1, 'aprobado', 'María Zoé Natera', 'Buen día equipo!

Solicito tomarme el día martes 4 de agosto para rendir un examen final en la universidad.

Ya fue coordinado con mi líder y equipo.
Saludos.', '31.07.2026'),
  ('lr_E42_12', 'E42', 'Final Days', '2026-09-16', '2026-09-16', 1, 'aprobado', 'María Zoé Natera', 'Equipo, solicito tomarme el día miércoles 16 de septiembre para rendir un parcial en la universidad.
Ya fue coordinado con mi líder y equipo. Saludos!', '09.09.2026'),
  ('lr_E42_13', 'E42', 'Final Days', '2026-09-29', '2026-09-29', 1, 'pendiente', 'Georgina Zunino En fila', 'Hola equipo! Solicito tomarme el día martes 29 de septiembre para rendir un parcial en la universidad. Ya fue coordinado con mi líder y equipo. Saludos!', ''),
  ('lr_E42_14', 'E42', 'Final Days', '2026-10-02', '2026-10-02', 1, 'pendiente', 'Georgina Zunino En fila', 'Hola equipo, solicito tomarme el día viernes 2 de octubre para rendir un parcial en la universidad. Ya fue coordinado con mi líder y equipo. Saludos!', ''),
  ('lr_E42_15', 'E42', 'Final Days', '2026-10-19', '2026-10-19', 1, 'pendiente', 'Georgina Zunino En fila', 'Hola equipo, solicito tomarme el día lunes 19 de octubre para rendir un parcial en la universidad. Ya fue coordinado con mi líder y equipo. Saludos!', ''),
  ('lr_I7_0', 'I7', 'Extra Day', '2025-02-14', '2025-02-14', 1, 'aprobado', 'María Zoé Natera', '', '06.02.2025'),
  ('lr_I7_1', 'I7', 'Vacaciones', '2025-04-07', '2025-04-27', 21, 'aprobado', 'María Zoé Natera', 'cambié porque había realizado mal la solicitud tanto al inicio como al ingreso, disculpen', '06.02.2025'),
  ('lr_I7_2', 'I7', 'Extra Day', '2025-06-11', '2025-06-11', 1, 'aprobado', 'María Zoé Natera', 'cita embajada americana', '09.06.2025'),
  ('lr_I7_3', 'I7', 'Vacaciones', '2025-07-03', '2025-07-04', 2, 'aprobado', 'María Zoé Natera', 'vacaciones', '18.06.2025'),
  ('lr_I7_4', 'I7', 'Extra Day', '2025-11-14', '2025-11-14', 1, 'aprobado', 'María Zoé Natera', '', '06.11.2025'),
  ('lr_I7_5', 'I7', 'Cumpleaños', '2025-11-28', '2025-11-28', 1, 'aprobado', '—', 'cumpleaños', ''),
  ('lr_I7_6', 'I7', 'Vacaciones', '2025-12-15', '2025-12-31', 17, 'aprobado', 'María Zoé Natera', 'Vacaciones', '10.11.2025'),
  ('lr_I7_7', 'I7', 'Vacaciones', '2026-01-01', '2026-01-04', 4, 'aprobado', 'María Zoé Natera', 'Vacaciones', '10.11.2025'),
  ('lr_I7_8', 'I7', 'Extra Day', '2026-02-13', '2026-02-13', 1, 'aprobado', 'María Zoé Natera', '', '08.01.2026'),
  ('lr_I7_9', 'I7', 'Extra Day', '2026-02-27', '2026-02-27', 1, 'aprobado', 'Georgina Zunino', 'Hola equipo necesito el día para viajar y tengo los vuelos a las 11:30 am y vuelvo a estar disponible 4pm', '23.02.2026'),
  ('lr_I7_10', 'I7', 'Vacaciones', '2026-03-02', '2026-03-15', 14, 'aprobado', 'María Zoé Natera', 'vacaciones', '01.12.2025'),
  ('lr_I7_11', 'I7', 'Extra Day', '2026-06-12', '2026-06-12', 1, 'aprobado', 'María Zoé Natera', 'Viaje', '01.06.2026'),
  ('lr_I7_12', 'I7', 'Extra Day', '2026-07-03', '2026-07-03', 1, 'aprobado', 'María Zoé Natera', 'viaje', '09.06.2026'),
  ('lr_I7_13', 'I7', 'Vacaciones', '2026-07-06', '2026-07-06', 1, 'aprobado', 'María Zoé Natera', 'chic@s necesito ese día porque tengo  los vuelos de regreso', '26.06.2026'),
  ('lr_I7_14', 'I7', 'Extra Day', '2026-10-06', '2026-10-06', 1, 'aprobado', 'Georgina Zunino', 'requiero resolver situaciones legales', '02.10.2026'),
  ('lr_I7_15', 'I7', 'Vacaciones', '2026-11-27', '2026-12-04', 8, 'aprobado', 'María Zoé Natera', 'viaje programado', '21.09.2026'),
  ('lr_E34_0', 'E34', 'Extra Day', '2025-01-10', '2025-01-10', 1, 'aprobado', 'María Zoé Natera', '', '13.01.2025'),
  ('lr_E34_1', 'E34', 'Extra Day', '2025-03-14', '2025-03-14', 1, 'aprobado', 'María Zoé Natera', '', '10.03.2025'),
  ('lr_E34_2', 'E34', 'Cumpleaños', '2025-05-16', '2025-05-16', 1, 'aprobado', '—', '', ''),
  ('lr_E34_3', 'E34', 'Extra Day', '2025-08-04', '2025-08-04', 1, 'aprobado', 'María Zoé Natera', 'Viaje a brc con el dev team', '26.06.2025'),
  ('lr_E34_4', 'E34', 'Vacaciones', '2025-08-05', '2025-08-07', 3, 'aprobado', 'María Zoé Natera', 'Viaje a BRC con los Devs', '26.06.2025'),
  ('lr_E34_5', 'E34', 'Extra Day', '2025-08-08', '2025-08-08', 1, 'aprobado', 'María Zoé Natera', 'Viaje a brc con el dev team', '25.06.2025'),
  ('lr_E34_6', 'E34', 'Extra Day', '2025-10-21', '2025-10-21', 1, 'aprobado', 'María Zoé Natera', 'Estreno de mi Casa 🏡', '17.10.2025'),
  ('lr_E34_7', 'E34', 'Mudanza', '2025-11-14', '2025-11-14', 1, 'aprobado', 'María Zoé Natera', '', '11.11.2025'),
  ('lr_E34_8', 'E34', 'Vacaciones', '2026-02-18', '2026-02-24', 7, 'aprobado', 'María Zoé Natera', 'Descansito', '08.01.2026'),
  ('lr_E34_9', 'E34', 'Extra Day', '2026-03-20', '2026-03-20', 1, 'aprobado', 'María Zoé Natera', 'Tramites varios', '10.03.2026'),
  ('lr_E34_10', 'E34', 'Cumpleaños', '2026-05-15', '2026-05-15', 1, 'aprobado', '—', '', ''),
  ('lr_E34_11', 'E34', 'Extra Day', '2026-06-11', '2026-06-11', 1, 'aprobado', 'María Zoé Natera', 'Ahora si, cumple de mi girlfriend', '05.06.2026'),
  ('lr_E34_12', 'E34', 'Extra Day', '2026-08-28', '2026-08-28', 1, 'aprobado', 'María Zoé Natera', 'Descansito', '26.08.2026'),
  ('lr_E34_13', 'E34', 'Vacaciones', '2026-09-21', '2026-09-24', 4, 'aprobado', 'María Zoé Natera', 'Descansito del tobi y el mati', '31.08.2026'),
  ('lr_E34_14', 'E34', 'Extra Day', '2026-10-16', '2026-10-16', 1, 'aprobado', 'Germán Alvarez', '', '09.10.2026'),
  ('lr_E28_0', 'E28', 'Vacaciones', '2025-03-12', '2025-03-24', 13, 'aprobado', 'María Zoé Natera', 'Equipo, solicito mis vacaciones desde el día 12-Mar-25 hasta el dia 24-Mar-25, reincorporandome el dia 25-Mar-25. 
Ya fue coordinado con mi lider y equipo! 
Saludos.', '19.02.2025'),
  ('lr_E28_1', 'E28', 'Final Days', '2025-08-05', '2025-08-05', 1, 'aprobado', 'María Zoé Natera', 'Equipo,

Solicito este día ya que tengo progamado un examen final presencial en Cordoba. 
Adjunto certificado en cuanto me lo entreguen ese mismo día.

Quedo a disposición,
Saludos!', '31.07.2025'),
  ('lr_E28_2', 'E28', 'Cumpleaños', '2025-10-07', '2025-10-07', 1, 'aprobado', '—', '', ''),
  ('lr_E28_3', 'E28', 'Extra Day', '2025-10-31', '2025-10-31', 1, 'aprobado', 'María Zoé Natera', '', '23.10.2025'),
  ('lr_E28_4', 'E28', 'Final Days', '2026-02-10', '2026-02-10', 1, 'aprobado', 'María Zoé Natera', 'Equipo, 

Solicito el día 10-Feb-2026 ya que debo viajar a Cordoba a rendir un examen. 
Ya fue conversado con mi lider y equipo. 

Quedo a disposicion por cualquier consulta.  
Saludos!', '04.02.2026'),
  ('lr_E28_5', 'E28', 'Final Days', '2026-03-02', '2026-03-02', 1, 'aprobado', 'María Zoé Natera', 'Equipo, buen día!

Solicito el ultimo día de examen para defender mi trabajo final de grado! 
Ya fue conversado con el equipo, y estan al tanto. 

Quedo a disposicion por cualquier consulta.  
S', '02.03.2026'),
  ('lr_E28_6', 'E28', 'Vacaciones', '2026-04-13', '2026-04-26', 14, 'aprobado', 'María Zoé Natera', 'Equipo, solicito mis vacaciones desde el día 13-Apr-26 hasta el dia 26-Apr-26, reincorporandome el dia 27-Apr-26.
Ya fue coordinado con mi lider y equipo!
Saludos.', '26.03.2026'),
  ('lr_E28_7', 'E28', 'Extra Day', '2026-06-05', '2026-06-05', 1, 'aprobado', 'María Zoé Natera', '', '04.06.2026'),
  ('lr_E35_0', 'E35', 'Extra Day', '2025-04-09', '2025-04-09', 1, 'aprobado', 'María Zoé Natera', '', '04.04.2025'),
  ('lr_E35_1', 'E35', 'Extra Day', '2025-05-26', '2025-05-26', 1, 'aprobado', 'María Zoé Natera', 'Hola Zoé, buen día! Quiero solicitar un extra day para el lunes 26 de mayo. Ya coordiné con Nati y el equipo.', '02.05.2025'),
  ('lr_E35_2', 'E35', 'Extra Day', '2025-07-21', '2025-07-21', 1, 'aprobado', 'María Zoé Natera', 'Buenos días Zoé! Quiero hacer uso del Extra Day para el lunes 21 de julio. Ya fue coordinado con el equipo. Muchas gracias ✨', '14.07.2025'),
  ('lr_E35_3', 'E35', 'Extra Day', '2025-09-19', '2025-09-19', 1, 'aprobado', 'María Zoé Natera', 'Buenas tardes Zoé! Quiero solicitar un extra day para el viernes 19 de septiembre. Ya fue coordinado con Nati y el equipo. Quedo atenta, gracias!', '11.09.2025'),
  ('lr_E35_4', 'E35', 'Extra Day', '2025-11-10', '2025-11-10', 1, 'aprobado', 'María Zoé Natera', 'Hola Zoe! Quiero solicitar un extra day para el lunes 10 de noviembre. Ya fue coordinado con Nati y el equipo. Gracias!', '17.10.2025'),
  ('lr_E35_5', 'E35', 'Cumpleaños', '2025-11-20', '2025-11-20', 0, 'aprobado', '—', 'Quiero solicitar el día de cumpleaños. Ya fue coordinado  con Nati y el resto del equipo. Gracias!!', ''),
  ('lr_E35_6', 'E35', 'Vacaciones', '2026-03-02', '2026-03-15', 14, 'aprobado', 'María Zoé Natera', 'Buenos días Zoe! Quiero solicitar 2 semanas de vacaciones. Ya fue coordinado con Nati y el resto del equipo. Gracias!', '20.01.2026'),
  ('lr_E35_7', 'E35', 'Extra Day', '2026-06-01', '2026-06-01', 1, 'aprobado', 'María Zoé Natera', 'Zoe quiero solicitar un extraday el lunes 1 de junio. Ya fue coordinado con Nati y el equipo. Gracias!!', '22.05.2026'),
  ('lr_E35_8', 'E35', 'Extra Day', '2026-07-13', '2026-07-13', 1, 'aprobado', 'María Zoé Natera', 'Hola Zoe! Quiero solicitar un extraday el lunes 13 de julio. Ya fue coordinado con Nati y el equipo. Gracias!!', '06.07.2026'),
  ('lr_E35_9', 'E35', 'Extra Day', '2026-09-08', '2026-09-08', 1, 'aprobado', 'María Zoé Natera', 'Hola Zowi!! 
Quiero solicitar el martes 8 de septiembre un extra day. Ya fue coordinado con el equipo. Gracias!', '24.08.2026'),
  ('lr_I3_0', 'I3', 'Vacaciones', '2025-05-14', '2025-05-30', 17, 'aprobado', 'María Zoé Natera', 'Viajo a USA', '14.04.2025'),
  ('lr_I3_1', 'I3', 'Vacaciones', '2026-02-08', '2026-02-14', 7, 'aprobado', 'María Zoé Natera', 'Nos vamos!', '27.01.2026'),
  ('lr_E20_0', 'E20', 'Vacaciones', '2025-02-10', '2025-02-16', 7, 'aprobado', 'María Zoé Natera', '', '03.02.2025'),
  ('lr_E20_1', 'E20', 'Extra Day', '2025-03-17', '2025-03-17', 1, 'aprobado', 'María Zoé Natera', 'Hola Zoé, lo hablé con el equipo en nuestra meet semanal del viernes 7/03. Gracias', '10.03.2025'),
  ('lr_E20_2', 'E20', 'Cumpleaños', '2025-04-07', '2025-04-07', 1, 'aprobado', '—', 'Hola equipo, solicito mi día libre por el cumpleaños. Ya coordinamos con el equipo. Gracias', ''),
  ('lr_E20_3', 'E20', 'Extra Day', '2025-05-16', '2025-05-16', 1, 'aprobado', 'Georgina Zunino', '', '05.05.2025'),
  ('lr_E20_4', 'E20', 'Extra Day', '2025-07-25', '2025-07-25', 1, 'aprobado', 'María Zoé Natera', 'Equipo, solicito tomarme un Extra Day el día 25-07-25.
Ya fue coordinado con mi líder y equipo!
Saludos', '11.07.2025'),
  ('lr_E20_5', 'E20', 'Final Days', '2025-07-28', '2025-07-28', 1, 'aprobado', 'María Zoé Natera', 'Equipo, solicito tomarme un final day.  Tengo constancia de inscripción pero no puedo adjuntarla aquí.
Ya hablé con Nati.
Gracias!', '21.07.2025'),
  ('lr_E20_6', 'E20', 'Vacaciones', '2025-10-20', '2025-10-26', 7, 'aprobado', 'Natalia Maffini', 'Hola equipo! Solicito vacaciones del 20/10 al 26/10. Ya lo coordiné con el equipo en nuestra meet del 25/10. Gracias!', '29.09.2025'),
  ('lr_E20_7', 'E20', 'Extra Day', '2025-11-17', '2025-11-17', 1, 'aprobado', 'María Zoé Natera', 'Hola equipo! Solicito el 17/11 como Extra day. Conversado con el equipo en la meet semanal de Clic2Ring.', '10.11.2025'),
  ('lr_E20_8', 'E20', 'Extra Day', '2025-12-02', '2025-12-02', 1, 'aprobado', 'María Zoé Natera', 'Hola equipo! Recién visualizo que no se envió la solicitud. Ya el equipo está avisando y planificado con el equipo desde la semana anterior. Disculpen', '01.12.2025'),
  ('lr_E20_9', 'E20', 'Final Days', '2025-12-19', '2025-12-19', 1, 'aprobado', 'María Zoé Natera', 'Hola chicas,  solicito un final day para rendir mis prácticas profesionales el viernes 19/12. Gracias!', '15.12.2025'),
  ('lr_E20_10', 'E20', 'Vacaciones', '2026-03-16', '2026-03-22', 7, 'aprobado', 'María Zoé Natera', 'Hola equipo! Solicito vacaciones desde 16/03 al 22/03. Ya lo coordiné con Nati y el equipo de PM y AM de los clientes que tenemos en conjunto con Lu que vuelve ese lunes. Gracias', '12.02.2026'),
  ('lr_E20_11', 'E20', 'Extra Day', '2026-05-20', '2026-05-20', 1, 'aprobado', 'María Zoé Natera', '', '15.05.2026'),
  ('lr_E20_12', 'E20', 'Mudanza', '2026-06-26', '2026-06-26', 1, 'aprobado', 'María Zoé Natera', '', '26.06.2026'),
  ('lr_E20_13', 'E20', 'Mudanza', '2026-06-29', '2026-06-29', 1, 'aprobado', 'María Zoé Natera', '', '26.06.2026'),
  ('lr_E20_14', 'E20', 'Extra Day', '2026-07-20', '2026-07-20', 1, 'aprobado', 'María Zoé Natera', 'Buenas tardes, conversado con equipo hoy luego de la meet de objetivos.', '13.07.2026'),
  ('lr_E20_15', 'E20', 'Extra Day', '2026-09-11', '2026-09-11', 1, 'aprobado', 'María Zoé Natera', '', '31.08.2026'),
  ('lr_E20_16', 'E20', 'Vacaciones', '2026-10-05', '2026-10-18', 14, 'aprobado', 'María Zoé Natera', 'Buenos días! Solicito del 5 al 18/10. Conversado con el equipo.', '07.09.2026'),
  ('lr_E26_0', 'E26', 'Enfermedad', '2024-09-25', '2024-09-26', 2, 'aprobado', 'María Zoé Natera', 'Reposo por 48hs', ''),
  ('lr_E26_1', 'E26', 'Extra Day', '2024-12-19', '2024-12-19', 1, 'aprobado', 'María Zoé Natera', '', '06.02.2025'),
  ('lr_E26_2', 'E26', 'Extra Day', '2025-06-18', '2025-06-18', 1, 'aprobado', 'María Zoé Natera', '', '11.06.2025'),
  ('lr_E26_3', 'E26', 'Vacaciones', '2025-08-04', '2025-08-17', 14, 'aprobado', 'María Zoé Natera', 'Solicito aprobación de mis vacaciones en la fecha 4/08 al 17/08
Gracias', '10.03.2025'),
  ('lr_E26_4', 'E26', 'Vacaciones', '2026-03-16', '2026-03-22', 7, 'aprobado', 'María Zoé Natera', 'Equipo, solicito mis vacaciones desde el día 16/03/2026 hasta el dia 22/03/2026 reincorporandome el dia 23/03/2026
Ya fue coordinado con mi lider y equipo! 
Saludos', '14.11.2025'),
  ('lr_E26_5', 'E26', 'Extra Day', '2026-06-25', '2026-06-25', 1, 'aprobado', 'María Zoé Natera', 'Team, necesito ese dia libre por un estudio medico.', '09.06.2026'),
  ('lr_E26_6', 'E26', 'Vacaciones', '2026-10-19', '2026-10-25', 7, 'aprobado', 'María Zoé Natera', 'Chicas, solicito los 7 dias que me quedan de este año para el periodo 19-25 de octubre.
Gracias', '10.08.2026'),
  ('lr_E24_0', 'E24', 'Vacaciones', '2025-01-17', '2025-01-26', 10, 'aprobado', 'María Zoé Natera', 'Vacaciones desde el 17-ene hasta el 26-ene inclusive con reincorporación el día 27-ene. Ya coordinado con el lider!', '15.01.2025'),
  ('lr_E24_1', 'E24', 'Extra Day', '2025-06-06', '2025-06-06', 1, 'aprobado', 'María Zoé Natera', '', '26.05.2025'),
  ('lr_E24_2', 'E24', 'Extra Day', '2025-10-31', '2025-10-31', 1, 'aprobado', 'Georgina Zunino', 'Georgi, tal como conversamos, este día viajo a ver Tini! Lo dejo registrado con tiempo. Gracias🙌🏽', '01.10.2025'),
  ('lr_E24_3', 'E24', 'Extra Day', '2025-12-04', '2025-12-04', 1, 'aprobado', 'Georgina Zunino', 'Turno para obtener la Visa! 🇺🇸', '01.12.2025'),
  ('lr_E24_4', 'E24', 'Extra Day', '2026-01-16', '2026-01-16', 1, 'aprobado', 'María Zoé Natera', 'Ya aprobado por Georgii! 🏞️', '09.01.2026'),
  ('lr_E24_5', 'E24', 'Vacaciones', '2026-02-18', '2026-03-01', 12, 'aprobado', 'María Zoé Natera', 'Ya conversado y aprobado por Georgi! 🙌🏽', '05.01.2026'),
  ('lr_E24_6', 'E24', 'Cumpleaños', '2026-04-17', '2026-04-17', 1, 'aprobado', '—', 'Ya conversado con Georgi! 💖', ''),
  ('lr_E24_7', 'E24', 'Extra Day', '2026-07-20', '2026-07-20', 1, 'aprobado', 'María Zoé Natera', 'Ya coordinado con Georgi!', '17.07.2026'),
  ('lr_E24_8', 'E24', 'Vacaciones', '2026-09-25', '2026-10-11', 17, 'aprobado', 'María Zoé Natera', 'Vacaciones 🇺🇸🗽🩷
Ya aprobado por Georgiii!!!', '12.01.2026'),
  ('lr_E31_0', 'E31', 'Vacaciones', '2024-12-11', '2024-12-22', 12, 'aprobado', 'María Zoé Natera', '', '01.10.2024'),
  ('lr_E31_1', 'E31', 'Extra Day', '2025-02-07', '2025-02-07', 1, 'aprobado', 'María Zoé Natera', 'Buenas!! Todo el equipo está al tanto del pedido de Extra Day. Ningún inconveniente con ello. Ya e
se están coordinando la delegación de tareas.
Gracias!', '03.02.2025'),
  ('lr_E31_2', 'E31', 'Extra Day', '2025-04-11', '2025-04-11', 1, 'aprobado', 'María Zoé Natera', 'Ya fue comunicado y consensuado con el líder y el equipo', '31.03.2025'),
  ('lr_E31_3', 'E31', 'Vacaciones', '2025-05-19', '2025-05-20', 2, 'aprobado', 'María Zoé Natera', 'Ya se consultó con el lider y todo el equipo. No hay inconvenientes', '09.05.2025'),
  ('lr_E31_4', 'E31', 'Enfermedad', '2025-07-07', '2025-07-08', 2, 'aprobado', 'María Zoé Natera', 'El equipo y el lider ya fueron notificados de esta situación.', '07.07.2025'),
  ('lr_E31_5', 'E31', 'Extra Day', '2025-07-18', '2025-07-18', 1, 'aprobado', 'María Zoé Natera', 'El equipo y el lider ya están al tanto del pedido de Extra Day. Todos de acuerdo', '11.07.2025'),
  ('lr_E31_6', 'E31', 'Cumpleaños', '2025-11-05', '2025-11-05', 1, 'aprobado', '—', 'Todo el equipo, incluido el líder, fue notificado sobre la solicitud', ''),
  ('lr_E31_7', 'E31', 'Extra Day', '2025-11-27', '2025-11-27', 1, 'aprobado', 'María Zoé Natera', 'Ya fue consensuado con todo el equipo', '20.11.2025'),
  ('lr_E31_8', 'E31', 'Extra Day', '2025-12-18', '2025-12-18', 1, 'aprobado', 'María Zoé Natera', 'Ya todo el equipo está al tanto de la solicitud del Extra Day. No hay ninguna objeción', '15.12.2025'),
  ('lr_E31_9', 'E31', 'Extra Day', '2026-02-09', '2026-02-09', 1, 'aprobado', 'María Zoé Natera', 'Hola!!
El equipo junto con el líder ya están al tanto de la solicitud de extra Day y no hay inconvenientes', '02.02.2026'),
  ('lr_E31_10', 'E31', 'Vacaciones', '2026-06-15', '2026-06-21', 7, 'aprobado', 'María Zoé Natera', 'Buenas!
Todo el equipo ya está al tanto de la solicitud de vacaciones, incluido el líder del área', '13.05.2026'),
  ('lr_E31_11', 'E31', 'Enfermedad', '2026-06-26', '2026-06-26', 1, 'aprobado', 'María Zoé Natera', 'La razón de la solicitud es una cirugía dental. Ya todo el equipo junto con el líder estan al tanto de la situación', '10.06.2026'),
  ('lr_E31_12', 'E31', 'Extra Day', '2026-07-30', '2026-07-30', 1, 'aprobado', 'María Zoé Natera', 'Buenas!! 
Ya todo el equipo está al tanto de la solicitud', '27.07.2026'),
  ('lr_E31_13', 'E31', 'Extra Day', '2026-09-24', '2026-09-24', 1, 'aprobado', 'María Zoé Natera', 'Buenas! Todo el equipo incluido el lider estan al tanto de la solicitud', '07.09.2026'),
  ('lr_E8_0', 'E8', 'Vacaciones', '2025-03-31', '2025-04-06', 7, 'aprobado', 'María Zoé Natera', 'Equipo, solicito mis vacaciones desde el día 30-03-2025 hasta el dia 06-04-2025, reincorporandome el dia 07-04-2025.
Ya fue coordinado con mi lider y equipo!
Saludos', '30.01.2025'),
  ('lr_E8_1', 'E8', 'Extra Day', '2025-04-24', '2025-04-24', 1, 'aprobado', 'María Zoé Natera', 'Equipo, solicito tomarme un Extra Day el día 24/04/2025.
no puedo coordinar con mi lider, porque esta de vacaciones. De todas maneras me llevo la compu ese dia, tengo que hacer un viaje.
Saludos', '11.04.2025'),
  ('lr_E8_2', 'E8', 'Extra Day', '2025-07-24', '2025-07-24', 1, 'aprobado', 'María Zoé Natera', 'Equipo, solicito tomarme un Extra Day el día 24-07-2025.
Ya fue coordinado con mi lider y equipo!
Saludos', '21.07.2025'),
  ('lr_E8_3', 'E8', 'Vacaciones', '2025-08-04', '2025-08-10', 7, 'aprobado', 'María Zoé Natera', 'Equipo, solicito mis vacaciones desde el día 04-08-25 hasta el dia 10-08-25, reincorporandome el dia 11-08-25. 
Ya fue coordinado con mi lider y equipo! 
Saludos', '24.06.2025'),
  ('lr_E8_4', 'E8', 'Cumpleaños', '2025-10-21', '2025-10-21', 1, 'aprobado', '—', '', ''),
  ('lr_E8_5', 'E8', 'Extra Day', '2025-12-01', '2025-12-01', 1, 'aprobado', 'María Zoé Natera', '', '26.11.2025'),
  ('lr_E8_6', 'E8', 'Vacaciones', '2026-02-18', '2026-03-02', 13, 'aprobado', 'María Zoé Natera', 'Ya pactado con mi lider', '06.11.2025'),
  ('lr_E8_7', 'E8', 'Extra Day', '2026-03-27', '2026-03-27', 1, 'aprobado', 'María Zoé Natera', 'Para ir a alentar a atenas, por la copa', '08.01.2026'),
  ('lr_E8_8', 'E8', 'Extra Day', '2026-06-01', '2026-06-01', 1, 'aprobado', 'María Zoé Natera', '', '22.05.2026'),
  ('lr_E8_9', 'E8', 'Vacaciones', '2026-07-29', '2026-08-02', 5, 'aprobado', 'María Zoé Natera', 'Viaje a la nieve con el equipo', '10.06.2026'),
  ('lr_E8_10', 'E8', 'Cumpleaños', '2026-10-22', '2026-10-22', 1, 'aprobado', '—', '', ''),
  ('lr_E8_11', 'E8', 'Vacaciones', '2026-10-23', '2026-10-25', 3, 'aprobado', 'María Zoé Natera', 'ultimos dias de vacaciones', '03.09.2026'),
  ('lr_E7_0', 'E7', 'Vacaciones', '2025-01-27', '2025-02-02', 7, 'aprobado', 'María Zoé Natera', 'Ya conversado con Nati y el equipo. Regreso antes por viaje a Colombia.', '03.02.2025'),
  ('lr_E7_1', 'E7', 'Extra Day', '2025-05-30', '2025-05-30', 1, 'aprobado', 'María Zoé Natera', 'solicitud consensuada con Nati.', '11.04.2025'),
  ('lr_E7_2', 'E7', 'Extra Day', '2025-07-04', '2025-07-06', 1, 'aprobado', 'María Zoé Natera', 'Hola equipo, buen día.

Luego de conversarlo con el equipo y haberlo acordado internamente, solicito tomar un Extra Day el próximo viernes 04 de julio de 2025.

Quedo atento ante cualquier comentario.', '24.06.2025'),
  ('lr_E7_3', 'E7', 'Extra Day', '2025-09-04', '2025-09-04', 1, 'aprobado', 'María Zoé Natera', 'Hola equipo.
A partir de lo conversado y consensuado con el equipo.
Solicito este "Extra Day", por tramites personales, por favor.', '02.09.2025'),
  ('lr_E7_4', 'E7', 'Extra Day', '2025-11-07', '2025-11-07', 1, 'aprobado', 'María Zoé Natera', 'Luego de conversar con el equipo, estando todos de acuerdo, solicito ausentarme este día por motivo de viaje.', '14.10.2025'),
  ('lr_E7_5', 'E7', 'Extra Day', '2025-12-22', '2025-12-22', 1, 'aprobado', 'María Zoé Natera', 'Hola equipo.
Luego de dialogar con todo el equipo de C2R, y estando de acuerdo, solicito un extra day el próximo 22.12.25.

Gracias!', '15.12.2025'),
  ('lr_E7_6', 'E7', 'Cumpleaños', '2026-02-02', '2026-02-02', 1, 'aprobado', '—', 'Luego de conversar con el equipo interno, estando todos de acuerdo, solicito el día de cumpleaños para el próximo lunes 2 de febrero.
Gracias!', ''),
  ('lr_E7_7', 'E7', 'Vacaciones', '2026-06-24', '2026-07-15', 22, 'aprobado', 'María Zoé Natera', 'A partir de dialogado previamente con RRHH, con Nati y resto de equipo y estando todos de acuerdo.

Me encontré fuera del país desde el 24 de junio hasta el 24 de julio, retomando mi actividad laboral', '28.04.2026'),
  ('lr_E7_8', 'E7', 'Extra Day', '2026-09-25', '2026-09-25', 1, 'aprobado', 'María Zoé Natera', 'Luego de haber conversado con el equipo, solicito extra day', '03.09.2026'),
  ('lr_E30_0', 'E30', 'Extra Day', '2024-10-30', '2024-10-30', 1, 'aprobado', 'María Zoé Natera', '', '13.02.2025'),
  ('lr_E30_1', 'E30', 'Extra Day', '2025-01-17', '2025-01-17', 1, 'aprobado', 'Georgina Zunino', 'Ya coordinado con el lider y el equipo!', '21.01.2025'),
  ('lr_E30_2', 'E30', 'Extra Day', '2025-05-12', '2025-05-12', 1, 'aprobado', 'María Zoé Natera', '', '22.04.2025'),
  ('lr_E30_3', 'E30', 'Extra Day', '2025-06-09', '2025-06-09', 1, 'aprobado', 'María Zoé Natera', 'Coordinado con el equipo', '04.06.2025'),
  ('lr_E30_4', 'E30', 'Vacaciones', '2025-08-25', '2025-09-07', 14, 'aprobado', 'María Zoé Natera', 'Equipo, solicito mis vacaciones desde el día 25.08.2025 hasta el día 07.09.2025, reincorporandome el día 08.09.2025
Ya fue notificado a mi líder y equipo directo. Se solicitan con anticipación para c', '10.03.2025'),
  ('lr_E30_5', 'E30', 'Cumpleaños', '2026-08-21', '2026-08-21', 1, 'aprobado', '—', '', ''),
  ('lr_E30_6', 'E30', 'Vacaciones', '2026-08-24', '2026-09-01', 9, 'aprobado', 'María Zoé Natera', 'Corto Martes 01/09 por viaje de visita a clientes.', '31.07.2026'),
  ('lr_E32_0', 'E32', 'Mudanza', '2025-03-25', '2025-03-26', 2, 'aprobado', 'María Zoé Natera', 'Equipo, solicito tomarme días de mudanza los días 25-mar-25 y 26-mar-25.
Ya fue coordinado con mi lider y equipo!
Saludos', '19.03.2025'),
  ('lr_E32_1', 'E32', 'Extra Day', '2025-04-09', '2025-04-09', 1, 'aprobado', 'María Zoé Natera', 'Equipo, solicito tomarme un Extra Day el día 09-abril-2025
Ya fue coordinado con mi líder y equipo!
Saludos', '03.04.2025'),
  ('lr_E32_2', 'E32', 'Vacaciones', '2025-05-26', '2025-06-01', 7, 'aprobado', 'María Zoé Natera', 'Equipo, solicito mis vacaciones desde el día 26/05/2025 hasta el día 01/06/2025, reincorporandome el día 02/06/2025. 
Ya fue coordinado con mi líder y equipo! 
Saludos', '11.02.2025'),
  ('lr_E32_3', 'E32', 'Extra Day', '2025-06-12', '2025-06-12', 1, 'aprobado', 'María Zoé Natera', 'Equipo, solicito tomarme un Extra Day el día 12-Jun-2025.
Ya fue coordinado con mi lider y equipo!
Saludos', '10.06.2025'),
  ('lr_E32_4', 'E32', 'Extra Day', '2025-11-17', '2025-11-17', 1, 'aprobado', 'María Zoé Natera', 'Equipo, solicito tomarme un Extra Day el día 17-Nov-2025
Ya fue coordinado con mi lider y equipo!
Saludos', '30.10.2025'),
  ('lr_E32_5', 'E32', 'Extra Day', '2025-12-04', '2025-12-04', 1, 'aprobado', 'María Zoé Natera', 'Equipo, solicito tomarme un Extra Day el día 4-Dic-2025.
Ya fue coordinado con mi lider y equipo!
Saludos', '29.10.2025'),
  ('lr_E32_6', 'E32', 'Vacaciones', '2025-12-09', '2025-12-15', 7, 'aprobado', 'María Zoé Natera', 'Equipo, solicito mis vacaciones desde el día 09-dic-2025 hasta el dia 15-Dic-2025, reincorporandome el dia 16-Dic-2025. 
Ya fue coordinado con mi lider y equipo! 
Saludos', '27.10.2025'),
  ('lr_E32_7', 'E32', 'Cumpleaños', '2026-01-30', '2026-01-30', 1, 'aprobado', '—', 'Hola equipo, 
Solicito tomarme mi día de cumpleaños el día 30-Ene-206. Ya fue coordinado previamente con el líder de mi área y el equipo. Saludos!', ''),
  ('lr_E32_8', 'E32', 'Final Days', '2026-03-03', '2026-03-03', 1, 'aprobado', 'María Zoé Natera', 'Hola equipo!
Solicito el día 03-mar-2026 como día de final. Ya ha sido coordinado con el equipo.

Gracias!', '03.03.2026'),
  ('lr_E32_9', 'E32', 'Vacaciones', '2026-05-26', '2026-06-01', 7, 'aprobado', 'María Zoé Natera', 'Equipo, solicito mis vacaciones desde el día 26-May-2026 hasta el dia 1-Jun-2026, reincorporandome el dia 2-Jun-2026. 
Ya fue coordinado con mi lider y equipo! 
Saludos', '03.03.2026'),
  ('lr_E32_10', 'E32', 'Extra Day', '2026-06-12', '2026-06-12', 1, 'aprobado', 'María Zoé Natera', 'Equipo, solicito tomarme un Extra Day el día 12-Jun-26
Ya fue coordinado con mi lider y equipo!
Saludos', '09.06.2026'),
  ('lr_E32_11', 'E32', 'Enfermedad', '2026-07-02', '2026-07-03', 2, 'aprobado', 'María Zoé Natera', 'Solicito 2 dias, tal como se indica en el presente certificado médico. 
Ya fue notificado a mi líder y equipo', '03.07.2026'),
  ('lr_E32_12', 'E32', 'Extra Day', '2026-07-13', '2026-07-13', 1, 'aprobado', 'Melisa Soledad Diaz Gonzalez', 'Equipo, solicito tomarme un Extra Day el día 13-Jul-26.
Ya fue coordinado con mi lider y equipo!
Saludos', '29.06.2026'),
  ('lr_E32_13', 'E32', 'Vacaciones', '2026-11-10', '2026-11-16', 7, 'pendiente', 'Alejandra Gregoris En fila', 'Equipo, solicito mis vacaciones desde el día 10-Nov-26 hasta el dia 16-Nov-2026, reincorporandome el dia 17-Nov-2026.
Ya fue coordinado con mi lider y equipo!
Saludos', ''),
  ('lr_I8_0', 'I8', 'Vacaciones', '2025-05-15', '2025-05-30', 16, 'aprobado', 'María Zoé Natera', 'vacaciones', '26.05.2025'),
  ('lr_E1_0', 'E1', 'Extra Day', '2024-12-20', '2024-12-20', 1, 'aprobado', 'María Zoé Natera', '', '30.01.2025'),
  ('lr_E1_1', 'E1', 'Vacaciones', '2025-04-21', '2025-04-28', 8, 'aprobado', 'María Zoé Natera', '"Equipo, solicito mis vacaciones desde el día 21-Abril 2025 hasta el dia 28-Abril 2025, reincorporandome el dia 29-Abril 2025. 
Ya fue coordinado con mi lider y equipo! 
Saludos"', '10.02.2025'),
  ('lr_E1_2', 'E1', 'Extra Day', '2025-05-23', '2025-05-23', 1, 'aprobado', 'María Zoé Natera', 'Extra Day por cumple de familiar.', '07.04.2025'),
  ('lr_E1_3', 'E1', 'Extra Day', '2025-06-27', '2025-06-27', 1, 'aprobado', 'Georgina Zunino', 'Extra day por viaje.', '05.05.2025'),
  ('lr_E1_4', 'E1', 'Extra Day', '2025-09-05', '2025-09-05', 1, 'aprobado', 'María Zoé Natera', 'Extra Day - viaje a Cordoba', '20.08.2025'),
  ('lr_E1_5', 'E1', 'Extra Day', '2025-11-28', '2025-11-28', 1, 'aprobado', 'María Zoé Natera', 'Extra day', '20.11.2025'),
  ('lr_E1_6', 'E1', 'Cumpleaños', '2025-12-12', '2025-12-12', 1, 'aprobado', '—', 'tomó como día  de cumpleaños el día  posterior al mismo.', ''),
  ('lr_E1_7', 'E1', 'Vacaciones', '2026-04-27', '2026-05-10', 14, 'aprobado', 'María Zoé Natera', 'Vacaciones del 27-Abril al 10-mayo para reincorporarme 11 de Mayo', '02.02.2026'),
  ('lr_E1_8', 'E1', 'Extra Day', '2026-06-19', '2026-06-19', 1, 'aprobado', 'María Zoé Natera', 'Extra day', '10.06.2026'),
  ('lr_E1_9', 'E1', 'Extra Day', '2026-09-18', '2026-09-18', 1, 'aprobado', 'María Zoé Natera', 'viaje', '27.08.2026'),
  ('lr_E1_10', 'E1', 'Extra Day', '2026-10-16', '2026-10-16', 1, 'aprobado', 'María Zoé Natera', '', '24.08.2026'),
  ('lr_E1_11', 'E1', 'Extra Day', '2026-11-06', '2026-11-06', 1, 'aprobado', 'María Zoé Natera', 'Viaje viernes. Solicitud Extra Day', '24.08.2026'),
  ('lr_E36_0', 'E36', 'Mudanza', '2025-03-03', '2025-03-04', 2, 'aprobado', 'María Zoé Natera', 'Solicitud de permiso mudanza aprobado por Carlos', '27.02.2025'),
  ('lr_E36_1', 'E36', 'Cumpleaños', '2025-08-01', '2025-08-01', 1, 'aprobado', '—', '', ''),
  ('lr_E36_2', 'E36', 'Vacaciones', '2026-06-16', '2026-06-19', 4, 'aprobado', 'María Zoé Natera', 'Requiero 4 días de vacaciones para viaje familiar', '11.05.2026'),
  ('lr_E36_3', 'E36', 'Vacaciones', '2026-10-13', '2026-10-16', 4, 'aprobado', 'María Zoé Natera', 'Vacaciones escolares y familia', '15.09.2026'),
  ('lr_E23_0', 'E23', 'Vacaciones', '2025-02-10', '2025-02-16', 7, 'aprobado', 'María Zoé Natera', 'Regresa el dia 17-feb.', '10.02.2025'),
  ('lr_E23_1', 'E23', 'Vacaciones', '2025-07-07', '2025-07-13', 7, 'aprobado', 'María Zoé Natera', 'Ya coordinado', '08.07.2025'),
  ('lr_E23_2', 'E23', 'Vacaciones', '2026-02-23', '2026-03-01', 7, 'aprobado', 'María Zoé Natera', 'Ya coordinado', '03.12.2025'),
  ('lr_E23_3', 'E23', 'Enfermedad', '2026-03-20', '2026-03-20', 1, 'aprobado', 'María Zoé Natera', '', '23.03.2026'),
  ('lr_E12_0', 'E12', 'Extra Day', '2025-04-25', '2025-04-25', 1, 'aprobado', 'María Zoé Natera', 'Tramites personales', '17.04.2025'),
  ('lr_E12_1', 'E12', 'Mudanza', '2025-05-16', '2025-05-16', 1, 'aprobado', 'María Zoé Natera', 'Buenas, solicito día p/ terminar mi mudanza. Ya esta hablado con Diego y Franco, probablemente necesite solo medio día y el resto este operativo.', '13.05.2025'),
  ('lr_E12_2', 'E12', 'Extra Day', '2025-07-04', '2025-07-04', 1, 'aprobado', 'María Zoé Natera', 'Me voy a reventar el aguinaldo.

Avisado Diego y equipo WebChat', '30.06.2025'),
  ('lr_E12_3', 'E12', 'Vacaciones', '2025-08-04', '2025-08-10', 7, 'aprobado', 'María Zoé Natera', 'Nos vamos a la nieve, ya charlado con Diego y Franco.

Coordinamos esa semana.', '01.07.2025'),
  ('lr_E12_4', 'E12', 'Vacaciones', '2025-08-11', '2025-08-17', 7, 'aprobado', 'María Zoé Natera', 'Repito por tercera vez, perdon Zoe', '23.07.2025'),
  ('lr_E12_5', 'E12', 'Extra Day', '2025-12-01', '2025-12-01', 1, 'aprobado', 'Diego Alvarez', 'Coordinado con Franco', '28.11.2025'),
  ('lr_E12_6', 'E12', 'Extra Day', '2025-12-19', '2025-12-19', 1, 'aprobado', 'María Zoé Natera', 'Coordinado con Franco', '15.12.2025'),
  ('lr_E12_7', 'E12', 'Vacaciones', '2026-02-18', '2026-02-24', 7, 'aprobado', 'María Zoé Natera', 'Coordinado con Diego', '12.02.2026'),
  ('lr_E12_8', 'E12', 'Extra Day', '2026-05-15', '2026-05-15', 1, 'aprobado', 'María Zoé Natera', 'Coordinado con Franco', '08.05.2026'),
  ('lr_E12_9', 'E12', 'Extra Day', '2026-06-05', '2026-06-05', 1, 'aprobado', 'María Zoé Natera', 'Coordinado con Franco', '01.06.2026'),
  ('lr_E12_10', 'E12', 'Vacaciones', '2026-07-29', '2026-08-02', 5, 'aprobado', 'María Zoé Natera', 'Nieve, actualizado pedido anterior que falto un día', '01.07.2026'),
  ('lr_E12_11', 'E12', 'Cumpleaños', '2026-08-14', '2026-08-14', 1, 'aprobado', '—', 'Por favor dejenme', ''),
  ('lr_E12_12', 'E12', 'Extra Day', '2026-09-25', '2026-09-25', 1, 'aprobado', 'María Zoé Natera', '', '21.09.2026'),
  ('lr_E4_0', 'E4', 'Vacaciones', '2024-12-09', '2024-12-22', 14, 'aprobado', 'María Zoé Natera', '', '22.11.2024'),
  ('lr_E4_1', 'E4', 'Extra Day', '2025-01-24', '2025-01-24', 1, 'aprobado', 'Georgina Zunino', '', '21.01.2025'),
  ('lr_E4_2', 'E4', 'Cumpleaños', '2025-03-12', '2025-03-12', 1, 'aprobado', '—', '', ''),
  ('lr_E4_3', 'E4', 'Extra Day', '2025-04-07', '2025-04-07', 1, 'aprobado', 'María Zoé Natera', 'Solicito un extra day por motivo de un viaje', '26.03.2025'),
  ('lr_E4_4', 'E4', 'Extra Day', '2025-06-02', '2025-06-02', 1, 'aprobado', 'María Zoé Natera', 'Solicito extra day para realizar gestiones personales', '28.05.2025'),
  ('lr_E4_5', 'E4', 'Vacaciones', '2025-07-14', '2025-07-17', 4, 'aprobado', 'María Zoé Natera', 'Solicito las vacaciones para el mes de julio', '23.06.2025'),
  ('lr_E4_6', 'E4', 'Vacaciones', '2025-08-04', '2025-08-10', 7, 'aprobado', 'María Zoé Natera', 'Equipo, solicito mis vacaciones desde el día 04/ago/2025 hasta el día 10/ago/2025, reincorporándome el día 11/ago/2025. 
Ya fue coordinado con mi líder y equipo! 
Saludos', '25.06.2025'),
  ('lr_E4_7', 'E4', 'Extra Day', '2025-12-02', '2025-12-02', 1, 'aprobado', 'María Zoé Natera', 'Solicitud de dia libre por viaje', '04.11.2025'),
  ('lr_E4_8', 'E4', 'Vacaciones', '2026-01-12', '2026-01-25', 14, 'aprobado', 'María Zoé Natera', 'Equipo,
Muevo las vacaciones por motivos personales.
Ya se coordinó con el equipo, gracias!', '03.12.2025'),
  ('lr_E4_9', 'E4', 'Cumpleaños', '2026-03-13', '2026-03-13', 1, 'aprobado', '—', '', ''),
  ('lr_E4_10', 'E4', 'Enfermedad', '2026-06-30', '2026-07-03', 4, 'aprobado', 'María Zoé Natera', 'Solicito los dias por cirugia.
Extendi hasta el viernes en el caso de que tenga que continuar internado.', '26.06.2026'),
  ('lr_E4_11', 'E4', 'Extra Day', '2026-08-21', '2026-08-21', 1, 'aprobado', 'María Zoé Natera', '', '18.08.2026'),
  ('lr_E4_12', 'E4', 'Vacaciones', '2026-09-16', '2026-09-20', 5, 'aprobado', 'María Zoé Natera', 'Solicito por viaje', '15.09.2026'),
  ('lr_E4_13', 'E4', 'Extra Day', '2026-09-28', '2026-09-28', 1, 'aprobado', 'María Zoé Natera', 'Solicito dia por viaje', '09.09.2026'),
  ('lr_E4_14', 'E4', 'Extra Day', '2026-10-19', '2026-10-19', 1, 'aprobado', 'María Zoé Natera', 'Solicito dia por viaje', '13.10.2026'),
  ('lr_I13_0', 'I13', 'Vacaciones', '2024-11-11', '2024-11-17', 7, 'aprobado', 'María Zoé Natera', '', '03.10.2024'),
  ('lr_I13_1', 'I13', 'Vacaciones', '2025-02-24', '2025-02-25', 2, 'aprobado', 'María Zoé Natera', 'Ajuste! Coordinado con el equipo y lider. 
Retoma actv el dia miercoles 26-feb', '10.02.2025'),
  ('lr_I13_2', 'I13', 'Extra Day', '2025-04-10', '2025-04-10', 1, 'aprobado', 'María Zoé Natera', 'De acuerdo a lo conversado con Nati, genero la solicitud para tener como extra day el 10 de abril. Gracias!', '20.03.2025'),
  ('lr_I13_3', 'I13', 'Extra Day', '2025-05-21', '2025-05-21', 1, 'aprobado', 'María Zoé Natera', 'De acuerdo a lo conversado con Nati solicito un extra day el 21 de mayo. Muchas gracias', '13.05.2025'),
  ('lr_I13_4', 'I13', 'Extra Day', '2025-06-25', '2025-06-25', 1, 'aprobado', 'María Zoé Natera', 'Hola Zoé! De acuerdo a lo conversado con Nati he solicitado el día 25 de junio como extra day.
Muchas gracias', '13.06.2025'),
  ('lr_I13_5', 'I13', 'Vacaciones', '2025-08-07', '2025-08-24', 18, 'aprobado', 'María Zoé Natera', 'De acuerdo a lo conversado con Nati y Zoé retomaría mis actividades el 25 de agosto. Muchas gracias', '09.04.2025'),
  ('lr_I13_6', 'I13', 'Extra Day', '2025-09-26', '2025-09-26', 1, 'aprobado', 'María Zoé Natera', 'Buen día chicas! De acuerdo a lo conversado con Nati solicito mi próximo Extra day el 26 de septiembre. Muchas gracias!', '11.09.2025'),
  ('lr_I13_7', 'I13', 'Fallecimiento', '2025-10-23', '2025-10-24', 2, 'aprobado', 'María Zoé Natera', '', '23.10.2025'),
  ('lr_I13_8', 'I13', 'Extra Day', '2025-12-17', '2025-12-17', 1, 'aprobado', 'María Zoé Natera', 'Buen día!! envío la solicitud de extra day para el miércoles 17 de diciembre. Lo conversé con Nati y el equipo previamente. Muchas gracias!', '15.12.2025'),
  ('lr_I13_9', 'I13', 'Cumpleaños', '2025-12-30', '2025-12-30', 1, 'aprobado', '—', 'Hola Zoé! cómo va? Envío esta solicitud para tomarme el día de mi cumple luego de haber consultado con Nati. Muchas gracias!', ''),
  ('lr_I13_10', 'I13', 'Extra Day', '2026-05-21', '2026-05-21', 1, 'aprobado', 'María Zoé Natera', 'De acuerdo a lo conversado con Nati solicito el extra day. Muchas gracias!', '08.05.2026'),
  ('lr_I13_11', 'I13', 'Extra Day', '2026-06-30', '2026-06-30', 1, 'aprobado', 'María Zoé Natera', 'Solicito el próximo 30 de junio como extra day de acuerdo a lo conversado con Nati. Muchas gracias!', '26.06.2026'),
  ('lr_I13_12', 'I13', 'Extra Day', '2026-07-31', '2026-07-31', 1, 'aprobado', 'María Zoé Natera', 'Buenos días, de acuerdo a lo conversado con Nati solicito como Extra day el viernes 31 de julio. Gracias', '24.07.2026'),
  ('lr_I13_13', 'I13', 'Vacaciones', '2026-09-14', '2026-09-28', 15, 'aprobado', 'María Zoé Natera', 'Buenas tardes, solicito vacaciones de acuerdo a lo conversado con Nati. Muchas gracias!', '20.08.2026');

-- ─── Verificación ───────────────────────────────────────────
SELECT COUNT(*) as empleados FROM employees;
SELECT COUNT(*) as licencias FROM leave_requests;
SELECT id, name, company, probation_status, status FROM employees ORDER BY name;