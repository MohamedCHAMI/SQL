Q1		create table syndic(
	code_syndic number(6),
	nom_syndic varchar2(10),
	prenom_syndic varchar2(10),
	telephone_syndic varchar2(10),
	mot_depass varchar2(10),
	constraint PK_code_syndic primary key (code_syndic)
	);

	create table  region(
	code_region number(6),
	nom_region varchar2(10),
	population_region number(6),
	total_region number(13,3) DEFAULT 0,
	constraint PK_code_region primary key (code_region)
	);

	create table ville(
	code_ville number(6),
	nom_ville varchar2(10),
	code_region number(6),
	total_ville number DEFAULT 0,
	constraint PK_code_ville primary key (code_ville),
	constraint FK_code_region FOREIGN key (code_region) REFERENCES region(code_region) ON DELETE CASCADE
	);

	create table quartier(
	code_quartier number(6),
	nom_quartier varchar2(10),
	population_quartier number(6),
	code_ville number(6),
	total_quartier number(13,3) DEFAULT 0,
	constraint PK_code_quartier	  primary key (code_quartier),
	constraint FK_code_ville FOREIGN key (code_ville) REFERENCES ville(code_ville) ON DELETE CASCADE
	);

	ALTER TABLE quartier
      modify (total_quartier number(20,3));

	create table bien_immobilier(
	code_bien number(6),
	adresse_bien varchar2(10),
	num_enregistrement number(6),
	superficie number (6),
	type varchar2(10),
	code_quartier number(6),
	date_construction  date,
	constraint PK_code_bien primary key (code_bien),
	constraint FK_code_quartier FOREIGN key (code_quartier) REFERENCES quartier(code_quartier) on DELETE CASCADE	
	);

	create table contrat(
	numcontrat  number(6),
	dateContrat date,
	prix_mensuel  number(19,3),
	code_bien  number(6),
	code_syndic number(6),
	etat varchar2(7),
	constraint PK_numcontrat primary key (numcontrat),
	constraint Fk_code_bien FOREIGN KEY (code_bien) REFERENCES bien_immobilier(code_bien) ON DELETE CASCADE,
	constraint FK_code_syndic FOREIGN key (code_syndic) REFERENCES syndic(code_syndic) ON DELETE CASCADE,
	constraint 	CH_etat check ( etat in ('en cours','resilie'))
	);



Q2		SElECT count(*)  from bien_immobilier bi , quartier q where bi.code_quartier = q.code_quartier  and 
		type = 'appart' group by bi.type;

Q3		update contrat
		set etat = 'actif'
		where etat = 'en cours';

Q4		
		create or replace procedure Q4(NBI out number , prix_mensuel out Contrat.prix_mensuel%type) is 
				begin 
				select count(*),sum(prix_mensuel) into NBI,prix_mensuel from bien_immobilier,Contrat where 
				Contrat.code_bien = bien_immobilier.code_bien and 
				upper(bien_immobilier.TYPE) like 'VILLA';
				end; /
				show errors

Q5		
		create or replace function Question5(qrt in varchar2) return number is
		VQ varchar2(20);
		VCount number;
		begin
		select sum(prix_mensuel),Count(*) into VQ,VCount from contrat,bien_immobilier,quartier,ville where 
		contrat.code_bien=bien_immobilier.code_bien and bien_immobilier.code_quartier=quartier.code_quartier 
		and quartier.code_ville=ville.code_ville 
		and type='villa' and lower(nom_ville)='casablanca' and quartier.nom_quartier=qrt;
		return VCount;
		end;
		/
		show errors

