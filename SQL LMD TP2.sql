/*1)*/ SELECT * from DEPT;
/*2)*/ SELECT * from EMP;
/*3)*/ SELECT Nom_EMP, Salaire FROM EMP;
/*4)*/ SELECT DISTINCT(ProF) from EMP;
/*5)*/ SELECT DateEMB FROM EMP where upper(PROF) like 'TECHNICIEN';
/*6)*/ SELECT * FROM EMP,DEPT;
/*7)*/ SELECT ENOM, DNOM from DEPT,EMP;

/*9)*/  SELECT DNOM from DEPT,EMP where DEPT.DIR = EMP.ENO and (DEPT.DNO = 1 or DEPT.DNO = 3);
/*10)*/ SELECT ENOM FROM EMP where DNO in(SELECT DNO FROM EMP where Upper(PROF) like 'INGENIEUR') 
/*10)*/ SELECT E1.ENOM from EMP.E1,EMP.E2 where E1.DNO = E2.DNO and E1.PROF = 'INGENIEUR' and E1.ENO <> E2.ENO ;
/*11)*/ SELECT Salaire,ENOM from EMP where Salaire > any(SELECT Salaire from EMP where upper(PROF) = 'INGENIEUR');
/*13)*/ SELECT E1.ENOM , E2.ENOM from EMP,DEPT where E1.ENO = DEPT.DIR and e2.DNO = DEPT.DNO;
/*14)*/ SELECT ENOM from EMP,DEPT where upper(ENOM) != 'YOUSSEF' and EMP.DNO = DEPT.DNO and DIR in(SELECT DEPT.DIR FROM
EMP,DEPT WHERE upper(EMP.ENOM) = 'YOUSSEF'and DEPT.DNO = EMP.DNO);
/*18)*/ SELECT ENOM FROM EMP WHERE DateEMB < all (SELECT DATEEMB FROM EMP,DEPT where DEPT.DNO = 1);
/*19)*/ SELECT ENOM from EMP,DEPT where upper(ENOM) != 'ALI' and EMP.DNO = DEPT.DNO and (DIR,PROF) in(SELECT DEPT.DIR,PROF FROM
EMP,DEPT WHERE upper(EMP.ENOM) = 'ALI' and DEPT.DNO = EMP.DNO);
/*20)*/ SELECT * FROM EMP WHERE COMM is not null;
/*21)*/ SELECT ENOM from EMP order by PROF , Salaire desc;
/*24)*/ SELECT DNO,MAX(Salaire) FROM DEPT Group by DNO ;
/*22)*/ SELECT ENOM,MAX(Salaire) FROM EMP,DEPT where Salaire = (SELECT Salaire from EMP,DEPT Where EMP.DNO = DEPT.DNO)