CREATE TABLE IF NOT EXISTS users
             (
                          id         INTEGER NOT NULL AUTO_INCREMENT,
                          first_name VARCHAR(30) NOT NULL,
                          last_name  VARCHAR(30) NOT NULL,
                          email      VARCHAR(150) NOT NULL,
                          PRIMARY KEY (id),
                          UNIQUE (email)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Sai','R','sai@sai.com'),(2,'Chris','M','chris.m@sai.com'),(3,'Piers','B','piers.b@sai.com');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;