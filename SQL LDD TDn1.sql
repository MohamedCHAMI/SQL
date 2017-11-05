create table STATION (
        nomStation varchar2(20) not null,
        capacite   number(5) not null,
        lieu       varchar2(20) not null,
        region     varchar2(20),
        tarif number(5) DEFAULT 0,
        primary key (nomStation),
        constraint uni unique (region ,lieu),
        constraint re check( region in('Ocean Indien','Antilles','Europe','Ameriques','Extreme Orient'))
        );
        
        
        
        
create table ACTIVITE (
        nomStation varchar2(20) references STATION(nomStation),
        libelle    varchar2(20) ,
        prix       number(5,5) default 0,
        primary key (libelle),
        constraint deletee foreign key (nomStation) references STATION on delete cascade
        );
        
        
create table CLIENT (
        id number(20),
        nom varchar2(20),
        prenom varchar2(20),
        ville varchar2(20) not null,
        regionc varchar2(20),
        solde number(5) default 0,
        primary key (id)
        );
        
        
        
create table SEJOUR (
        id number(20) references CLIENT(id),
        station varchar2(20) references STATION(nomStation),
        debut Date(8),
        nbrplaces number(5) not null,
        primary key (debut)
        );
        
insert INTO ACTIVITE values('Mogadoor','Voile',150);
insert INTO ACTIVITE values('Mogadoor','Plogee',120);
         Alter table ACTIVITE 
modify prix       number(5) default 0,

        select name_constraint from user_constraints where table_name = 'SEJOUR';
        ;