client(codecli, nomc,catc,valc)
article(codeart,nomA,color,prixachat,prixvente,QTEST)
commend(nomcom,codecli,datecom)
detailcommend(nomcom,codeart,qtcomd)

create table client1 (
    codecli varchar2(20),
    nomc varchar2(20),
    catc number(5),
    valc varchar2(20),
    primary key (codecli)
);

create table article (
    codeart varchar2(20),
    NomA varchar2(20),
    color varchar2(20),
    prixachat number(5),
    prixvent number(5),
    QTESTK number(5),
    primary key (codeart)
);

create table commende (
    numcom number(10) ,
    codecli varchar2(20),
    datecom date,
    constraint PKC primary key (numcom),
    constraint FKC foreign key (codecli) references client1 (codecli) on delete cascade
);

create table detailcommend (
    numcom number(10),
    codeart varchar2(20),
    qtcomd number(5),
    constraint PKCA primary key (numcom,codeart),
    constraint FKNC foreign key (numcom) references commende (numcom) on delete cascade,
    constraint FKCA foreign key (codeart) references article (codeart) on delete cascade
);


1) select * from client1;
2) select codecli from client1;
3) select * from client1 where valc = 'Paris';
4) select * from client1 where codecli = '3';
5) select CODECLI from client1 where valc = 'Paris' and catc > '3' ;
6) select numcom from detailcommend where codeart = 'A400' and qtcomd > '4' ;
7) select codecli,nomc from client1 where catc > '2';
8) select * from article where prixachat <=prixvent ;
9) 
15) select * from client1 where nomc like 'BO%';
16) select * from client1 order by nomc;
17) select * from article where prixachat <= '200' order by QTESTK desc ;
18) select codeart , prixvent-prixachat as marge from article;
19) select codeart , prixvent-prixachat as marge from article where prixachat < '100' ;
20) select AVG(QTESTK) from article;
21) select count(distinct color) from article;
23) select min(prixachat) from article ;
26) select AVG(QTESTK) , max(prixvent-prixachat) as marge , (max(prixvent)-max(prixachat)) as differnce from article where color = 'Rouge';
29) select color,avg(prixvent)as moyenPV from article where prixachat > 100 group by COLOR order by avg(prixvent) desc;
30) select CATC ,count(codecli)as NomberClient from client1 GROUP BY catc;
31) select codeart,NomA from article where QTESTK > (select avg(QTESTK)from article);
32) select color,avg(prixvent) from article group by color having avg(prixvent) > 200 order by avg(prixvent) desc;
33) select Client1.codecli,sum(prixvent*nvl(qtcomd,1))  as chiffer_Affaire from client1,article,detailcommend,commende where commende.codecli(+) = client1.codecli and commende.numcom = DETAILCOMMEND.numcom(+) and detailcommend.codeart (+)= article.codeart group By client1.codecli;
34) select ARTICLE.codeart,sum(nvl(qtcomd,0)) as Somme from DETAILCOMMEND full outer join ARTICLE on  DETAILCOMMEND.codeart = ARTICLE.codeart group by ARTICLE.codeart;
35) select sum(prixvent*qtcomd) , extract(month from datecom) as DateMonth from article,commende,detailcommend where
group By extract(month from datecom);
36) select codecli from client1 minus select codecli from commende where to_char(datecom)
in(to_char(extract(year from datecom)) = '97' and to_char(extract(month from datecom)) = 'Sep');
37) select codecli from client1 minus select codecli from commende where to_char(datecom)
not in(to_char(extract(year from datecom)) = '97' and to_char(extract(month from datecom)) = 'Sep');
39) select codecli from commende where datecom between '01/08/97' and '31/08/97' intersect select codecli from commende
where datecom between '01/08/97' and '31/08/97';
40)) select codecli from client1 where valc 7 = 'Paris' union select codecli from commende where 
to_number(extract(month from datecom)) = 09;
41) SELECT codecli, NOMC from CLIENT1,COMMENDE where Commende.codecli = CLIENT1.codecli ORDER BY NOMC;
42) SELECT codeart , NOMA from ARTICLE 
43) SELECT codeart, NomA from article,COMMENDE where datecom between to_number(extract(month from datecom)) = 08 and to_number(extract(year from datecom)) = 97;
44) select codeart, nomA from article,client1 where upper(valc) like 'PARIS'
46) SELECT * from ARTICLE where prixvente > (SELECT prixvente from ARTICLE where nomA like 'A100') ;
47) 
49) SELECT * from ARTICLE where prixvent > (SELECT MIN(prixvent) from ARTICLE where upper(color) like 'BLANCHE' );































insert into client1 values('C001','Martin',2,'Londes');
insert into client1 values ('C002','Dupont',1,'Paris');
insert into client1 values ('C003','Lebrave',3,'Londes');
insert into client1 values ('C004','Csimple',2,'Londes');
insert into client1 values ('C005','Martin',3,'Nice');
insert into client1 values ('C006','Lebon',1,'Geneve');
insert into client1 values ('C007','Dupin',1,'Paris');


insert into article values ('A100','Jupe','Rouge',170,289,10);
insert into article values ('A200','Robe','Rouge',180,329,15);
insert into article values ('A300','Jupe','Blanche',185,239,20);
insert into article values ('A400','Chemise','Blanche',100,199,10);
insert into article values ('A500','Chemise','Rouge',100,199,5);
insert into article values ('A600','Vest','Bleue',245,399,7);

insert into commende values (970898,'C003',to_date('06/06/2017','dd/mm/yyyy'));
insert into commende values (970817,'C003','04/Aug/97');
insert into commende values (970818,'C003','05/Aug/97');
insert into commende values (970819,'C007','20/Aug/97');
insert into commende values (970920,'C005','05/Sep/97');
insert into commende values (970825,'C007','07/Sep/97');
insert into commende values (970927,'C007','17/Sep/97');
insert into commende values (970930,'C001','20/Sep/97');
insert into commende values (971004,'C007','20/Sep/97');
insert into commende values (971819,'C007',to_date('20/9/97','dd/mm/yyyy'));



insert into detailcommend values (970817,'A100',1);
insert into detailcommend values (970817,'A200',5);
insert into detailcommend values (970817,'A300',2);
insert into detailcommend values (970817,'A500',2);
insert into detailcommend values (970818,'A500',8);
insert into detailcommend values (970818,'A400',2);
insert into detailcommend values (970819,'A100',3);
insert into detailcommend values (970819,'A500',7);
insert into detailcommend values (970819,'A600',2);
insert into detailcommend values (970820,'A200',7);
insert into detailcommend values (970820,'A500',5);

