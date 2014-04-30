DROP TABLE IF EXISTS t_account;
DROP TABLE IF EXISTS t_group;
DROP TABLE IF EXISTS t_event;
DROP TABLE IF EXISTS t_commit;
DROP TABLE IF EXISTS t_pending_group_add;

CREATE TABLE t_account (
    account_id mediumint NOT NULL AUTO_INCREMENT PRIMARY KEY,	
    first_name varchar(255) NOT NULL, 
    last_name varchar(255) NOT NULL,
    email varchar(255) NOT NULL,
    password_hash varchar(255) NOT NULL
);

CREATE TABLE t_group (
    group_id mediumint NOT NULL AUTO_INCREMENT PRIMARY KEY,	
    group_name varchar(255) NOT NULL,
    group_members array(mediumint) NOT NULL,
    group_owner mediumint NOT NULL FORIEGN KEY
);

CREATE TABLE t_event (
    event_id mediumint NOT NULL AUTO_INCREMENT PRIMARY KEY,
    event_name varchar(255) NOT NULL,	
    event_location varchar(255) NOT NULL,
    event_date timestamp NOT NULL,
    group_id mediumint NOT NULL,
    event_owner mediumint NOT NULL,
    notify_params array(varchar(255)) NOT NULL,
    reminder_params array(varchar(255)) NOT NULL
);

CREATE TABLE t_commit (
    account_id mediumint NOT NULL,	
    event_id mediumint NOT NULL,
    in_answer varchar(1) NULL
);

CREATE TABLE t_pending_group_add (
    account_id mediumint NOT NULL,	
    group_id mediumint NOT NULL
);
