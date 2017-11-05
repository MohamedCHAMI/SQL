create table tuteur(
idp varchar2(5),
idtuteur varchar2(5) foreign key references employe(idemp),
primarykey (idp ; idtuteur)
);


create table semaine (
ids number(2),
check ids between 1 and 52 ,
primary key (ids)
);

check ids + 1 or ids = 7 
check ids in (1,7,10)
check ids notin (1,7,10)



create table cinema(
        numc number(20),
        nomc varchar2(20),
        adressc varchar2(20),
        codepostal number(5) references ville(codep),
        primary key (numc)
);

create table ville(
      codep number(5) primary key,
      nomv varchar2(20)
);

create table salle (
      nums number(5) primary key,
      capacites number,
      numcinema number (20) references cinema (numc)
      );
      
create table film ( 
     numf number(5) primary key,
     titref varchar2 (20),
     dureef number (5) ,
     coded varchar2 (5)
);

create table projecteur (
     idpro number(5) primary key,
     numsalle number(5) foreign key references salle (nums),
     numfilm number(5) foreign key references film (numf),
     codesemaine  foreign key references semaine (codes),
     numberenterd number (5)
);