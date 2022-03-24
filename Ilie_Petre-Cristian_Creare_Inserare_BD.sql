------------------------------ Creare tabele ---------------------------------

create table ORAS(
id_oras number(5) constraint id_oras_pk primary key,
denumire varchar2(50) constraint denumire_oras_nn not null
);

create sequence orase
start with 1
increment by 1;

insert into ORAS
values (orase.nextval,'Bucuresti');
insert into ORAS
values (orase.nextval,'Giurgiu');
insert into ORAS
values (orase.nextval,'Popesti-Leordeni');
insert into ORAS
values (orase.nextval,'Focsani');
insert into ORAS
values (orase.nextval,'Buzau');

select *
from oras;
------------------------------------------------------------------------------
create table ADRESA(
id_adresa number(5) constraint id_adresa_pk primary key,
id_oras number(5) constraint adresa_oras_nn not null,
cod_postal number(6) constraint cod_postal_nn not null,
info_adresa varchar2(60),
foreign key (id_oras) references ORAS(id_oras)
);

create sequence adrese
start with 150
increment by 1;

insert into ADRESA (id_adresa,id_oras,cod_postal)
values (adrese.nextval,3,123456);
insert into ADRESA
values (adrese.nextval,4,512312,'Str. Stadionului, Nr. 45, Bl.2');
insert into ADRESA
values (adrese.nextval,5,278912,'Str. Gheorghe Doja Nr. 101');
insert into ADRESA
values (adrese.nextval,1,278912,'Str. Republicii Nr.1, Bl.18, Sc.2, Ap. 27');
insert into ADRESA
values (adrese.nextval,2,703503,'Str.  Constantin Nottara, Bl. C/10, Ap. 3');
insert into ADRESA
values (adrese.nextval,2,408857,'Calea Eroilor nr. 70, bl. C, ap. 86');
insert into ADRESA
values (adrese.nextval,3,250633,'Calea Invatatorului 77, Mun. Cazanesti');
insert into ADRESA
values (adrese.nextval,1,777345,'B-dul. Croitorilor 853, Mun. Piatra-Olt, Olt');
insert into ADRESA
values (adrese.nextval,4,429313,'Calea J.J Rousseau nr. 75, bl. 8, ap. 02');
insert into ADRESA
values (adrese.nextval,5,732233,'Calea P?durii 9B, Sântana');
insert into ADRESA
values (adrese.nextval,5,236728,'Splaiul Mircea cel B?trân nr. 24, bl. B, ap. 96');
insert into ADRESA
values (adrese.nextval,4,205367,'Str. Vlad ?epe? 3, Mun. Piatra-Olt, Alba');
insert into ADRESA
values (adrese.nextval,1,566457,'Calea Some? 781');
insert into ADRESA
values (adrese.nextval,1,610487,'Splaiul Piersicului nr. 1/3, bl. C, ap. 4');
insert into ADRESA
values (adrese.nextval,1,251695,'Splaiul Mircea cel B?trân nr. 8B, bl. 31, ap. 52');

select *
from adresa;
------------------------------------------------------------------------------
create table ANGAJAT(
id_angajat number(5) constraint id_angajat_pk primary key,
nume varchar2(30) constraint nume_nn not null,
prenume varchar2(30) constraint prenume_nn not null,
id_adresa number(5) constraint angajat_adresa_nn not null,
nr_telefon varchar2(15) constraint nr_telefon_nn not null,
email varchar2(320),
cnp varchar(13) constraint cnp_nn not null,
foreign key (id_adresa) references ADRESA(id_adresa)
);

create sequence angajati
start with 300
increment by 1;

insert into angajat(id_angajat,nume,prenume,id_adresa,nr_telefon,cnp)
values (angajati.nextval,'Ana','Macovei',151,'0273833014','2910509017336');
insert into angajat(id_angajat,nume,prenume,id_adresa,nr_telefon,cnp)
values (angajati.nextval,'Tudor','Mihai',153,'0771267946','1910273219266');
insert into angajat(id_angajat,nume,prenume,id_adresa,nr_telefon,cnp)
values (angajati.nextval,'Lidia','Ardelean',158,'0273833014','2970325016504');
insert into angajat
values (angajati.nextval,'Lazar','Niculescu',155,'0713702623','lazarcu@gmail.com','2910509017336');
insert into angajat
values (angajati.nextval,'Julia','Botezatu',150,'0363617583','juliabo@gmail.com','2970801416971');
insert into angajat
values (angajati.nextval,'Nelu','Teodorescu',151,'0351276737','nelutescu@gmail.com','1910305417705');
insert into angajat
values (angajati.nextval,'Gina','Ene',153,'0230865520','ginane@gmail.com','2880616314790');
insert into angajat
values (angajati.nextval,'Avram','Mihai',154,'0249576019','avramula@gmail.com','1990305103710');
insert into angajat
values (angajati.nextval,'Marcel','Simionescu',156,'0362000525','marcescu@gmail.com','1950416071974');
insert into angajat
values (angajati.nextval,'Delia','Blaga',152,'0756529565','deliablaga@gmail.com','2981128234029');
insert into angajat
values (angajati.nextval,'Ortansa','Toma',151,'0780347918','ortama@gmail.com','2900405098050');
insert into angajat
values (angajati.nextval,'Laurentiu','Nicolae',161,'0219039494','laurnic@gmail.com','1860712366795');
insert into angajat
values (angajati.nextval,'Jan','Filip',163,'0719319182','janflip@gmail.com','5020202209100');
insert into angajat
values (angajati.nextval,'Valentina','Chirila',164,'0746203124','valela@gmail.com','6010528100830');
insert into angajat
values (angajati.nextval,'Timotei','Rusu',160,'0244886450','timotsu@gmail.com','1871221321071');

select *
from angajat;
------------------------------------------------------------------------------
create table SEDIU(
id_sediu number(5) constraint id_sediu_pk primary key,
id_adresa number(5) constraint sediu_adresa_nn not null,
foreign key (id_adresa) references ADRESA(id_adresa)
);

create sequence sedii
start with 500
increment by 1;

insert into sediu
values (sedii.nextval,152);
insert into sediu
values (sedii.nextval,154);
insert into sediu
values (sedii.nextval,156);
insert into sediu
values (sedii.nextval,157);
insert into sediu
values (sedii.nextval,159);

select *
from sediu;
------------------------------------------------------------------------------
create table INSTRUCTOR (
id_angajat number(5) constraint id_instructor_pk primary key,
data_carnet date constraint data_carnet_nn not null,
foreign key (id_angajat) references ANGAJAT(id_angajat)
);

insert into instructor
values (301,to_date('11/03/1998','DD/MM/YYYY'));
insert into instructor
values (303,to_date('27/05/2001','DD/MM/YYYY'));
insert into instructor
values (304,to_date('13/01/2004','DD/MM/YYYY'));
insert into instructor
values (343,to_date('13/01/2004','DD/MM/YYYY'));
insert into instructor
values (347,to_date('13/01/2004','DD/MM/YYYY'));

select *
from instructor;
------------------------------------------------------------------------------
create table PROF_LEGIS(
id_angajat number(5) constraint id_prof_pk primary key,
tip_fac varchar2(25) constraint tip_fac_nn not null,
data_exam date constraint data_exam_nn not null,
constraint CHK_tip_fac check (lower(tip_fac) in ('tehnic','juridic')),
foreign key (id_angajat) references ANGAJAT(id_angajat)
);

insert into prof_legis
values (302,'Tehnic',to_date('27/04/2019','DD/MM/YYYY'));
insert into prof_legis
values (320,'Tehnic',to_date('13/02/2016','DD/MM/YYYY'));
insert into prof_legis
values (340,'Juridic',to_date('05/07/2020','DD/MM/YYYY'));
insert into prof_legis
values (341,'Tehnic',to_date('12/07/2020','DD/MM/YYYY'));
insert into prof_legis
values (342,'Juridic',to_date('04/09/2018','DD/MM/YYYY'));

select *
from prof_legis;
------------------------------------------------------------------------------
create table SECRETAR(
id_angajat number(5) constraint id_secretar_pk primary key,
id_sediu number(5) constraint secretar_sediu_nn not null,
foreign key (id_angajat) references ANGAJAT(id_angajat),
foreign key (id_sediu) references SEDIU(id_sediu)
);


insert into secretar
values (300,501);
insert into secretar
values (344,502);
insert into secretar
values (345,503);
insert into secretar
values (346,504);
insert into secretar
values (348,500);

select *
from secretar;
------------------------------------------------------------------------------
create table AUTOMOBIL(
id_automobil number(5) constraint id_automobil_pk primary key,
marca varchar2(30) constraint marca_nn not null,
model varchar2(30),
categorie_automobil varchar2(2) constraint categorie_nn not null,
constraint CHK_cat_auto check(lower(categorie_automobil) in ('a1','a2','b1','be','b'))
);

create sequence automobile
start with 750
increment by 1;

insert into automobil
values (automobile.nextval,'Honda','CBR 125R','A1');
insert into automobil
values (automobile.nextval,'Ducati','Cafe Racer','A2');
insert into automobil
values (automobile.nextval,'Aixam','Coupe GTI','B1');
insert into automobil
values (automobile.nextval,'Volkswagen','Passat','B');
insert into automobil(id_automobil,marca,categorie_automobil)
values (automobile.nextval,'BMW','BE');

select *
from automobil;
------------------------------------------------------------------------------
create table CLIENT(
id_client number(5) constraint id_client_pk primary key,
nume varchar2(30) constraint nume_client_nn not null,
prenume varchar2(30) constraint prenume_client_nn not null,
data_nasterii date constraint datanasterii_nn not null,
id_adresa number(5) constraint client_adresa_nn not null,
nr_telefon varchar2(15) constraint nr_telefon_client_nn not null,
email varchar2(320),
cnp varchar(13) constraint cnp_client_nn not null,
foreign key (id_adresa) references ADRESA(id_adresa)
);

create sequence clienti
start with 1000
increment by 1;

insert into client
values (clienti.nextval,'Anuta','Stoica',to_date('06/12/2000','DD/MM/YYYY'),164,'0718465446','anutaca@gmail.com','2880904356822');
insert into client
values (clienti.nextval,'Visaron','Ionescu',to_date('02/03/1989','DD/MM/YYYY'),162,'0781572802','visaion@gmail.com','1860622454782');
insert into client
values (clienti.nextval,'Lavinia','Farcas',to_date('13/08/1999','DD/MM/YYYY'),161,'0753974373','lavinias@gmail.com','2921116016491');
insert into client
values (clienti.nextval,'Calin','Catana',to_date('25/03/2001','DD/MM/YYYY'),163,'0377556929','calincana@gmail.com','1880915165075');
insert into client
values (clienti.nextval,'Isabela','Pana',to_date('16/04/1992','DD/MM/YYYY'),158,'0346918264','isabelana@gmail.com','2960331113593');

select *
from client;
------------------------------------------------------------------------------
create table LECTIE_PRACTICA(
id_lectiepr number(5) constraint id_lectiepr_pk primary key,
id_instructor number(5) constraint lpr_instructor_nn not null,
id_elev number(5) constraint lpr_elev_nn not null,
id_automobil number(5) constraint lpr_automobil_nn not null,
data date constraint data_lpr_nn not null,
km_parcursi float(5) constraint km_nn not null,
foreign key (id_instructor) references INSTRUCTOR(id_angajat),
foreign key (id_elev) references CLIENT(id_client),
foreign key (id_automobil) references AUTOMOBIL(id_automobil)
);

create sequence practice
start with 1500
increment by 1;

insert into lectie_practica
values (practice.nextval,303,1001,750,to_date('23/07/2020','DD/MM/YYYY'),23);
insert into lectie_practica
values (practice.nextval,303,1002,750,to_date('25/07/2020','DD/MM/YYYY'),20);
insert into lectie_practica
values (practice.nextval,301,1001,752,to_date('23/07/2020','DD/MM/YYYY'),21.5);
insert into lectie_practica
values (practice.nextval,343,1003,753,to_date('28/07/2020','DD/MM/YYYY'),24.8);
insert into lectie_practica
values (practice.nextval,347,1004,754,to_date('02/08/2020','DD/MM/YYYY'),19.5);

select *
from lectie_practica;
------------------------------------------------------------------------------
create table contract(
id_contract number(5) constraint id_contract_pk primary key,
id_secretar number(5) constraint contract_secretar_nn not null,
id_client number(5) constraint contract_client_nn not null,
data_semnare date constraint contract_data_nn not null,
detalii_contract varchar2(255) constraint detalii_nn not null,
foreign key (id_secretar) references SECRETAR(id_angajat),
foreign key (id_client) references CLIENT(id_client)
);

create sequence contracte
start with 2000
increment by 1;

insert into contract
values (contracte.nextval,344,1000,to_date('13/3/2020','DD/MM/YYYY'),'Pret: 2200 lei');
insert into contract
values (contracte.nextval,346,1001,to_date('17/07/2020','DD/MM/YYYY'),'Pret: 2450 lei');
insert into contract
values (contracte.nextval,348,1002,to_date('19/07/2020','DD/MM/YYYY'),'Pret: 2200 lei');
insert into contract
values (contracte.nextval,346,1003,to_date('20/07/2020','DD/MM/YYYY'),'Pret: 1400 lei, Categoria A1');
insert into contract
values (contracte.nextval,300,1004,to_date('28/09/2020','DD/MM/YYYY'),'Pret 2200 lei');

select *
from contract;
------------------------------------------------------------------------------
create table plata(
id_plata number(5) constraint plata_pk primary key,
id_contract number(5) constraint plata_contract_nn not null,
data date,
suma number(10) constraint suma_nn not null,
foreign key (id_contract) references CONTRACT(id_contract)
);

create sequence plati
start with 2500
increment by 1;

insert into plata
values (plati.nextval,2001,to_date('17/03/2020','DD/MM/YYYY'),750);
insert into plata
values (plati.nextval,2002,to_date('18/08/2020','DD/MM/YYYY'),500);
insert into plata
values (plati.nextval,2003,to_date('19/06/2020','DD/MM/YYYY'),1000);
insert into plata
values (plati.nextval,2003,to_date('27/06/2020','DD/MM/YYYY'),1000);
insert into plata
values (plati.nextval,2003,to_date('05/08/2020','DD/MM/YYYY'),200);

select *
from plata;
------------------------------------------------------------------------------
create table LECTIE_TEORETICA(
id_lectietr number(5) constraint lectietr_pk primary key,
id_profesor number(5) constraint teor_prof_nn not null,
id_sediu number(5) constraint teor_sediu_nn not null,
data date constraint teor_data_nn not null,
detalii_suplimentare varchar2(150),
foreign key (id_profesor) references PROF_LEGIS(id_angajat),
foreign key (id_sediu) references SEDIU(id_sediu)
);

create sequence teoretice
start with 3000
increment by 1;

insert into lectie_teoretica
values (teoretice.nextval,342,500,to_date('25/03/2021','DD/MM/YYYY'),'Chestionare');
insert into lectie_teoretica
values (teoretice.nextval,320,501,to_date('16/04/2021','DD/MM/YYYY'),'Intrebari indicatoare');
insert into lectie_teoretica
values (teoretice.nextval,320,502,to_date('23/02/2021','DD/MM/YYYY'),'Intrebari semnale');
insert into lectie_teoretica
values (teoretice.nextval,340,501,to_date('15/01/2021','DD/MM/YYYY'),'Intrebari mecanica');
insert into lectie_teoretica
values (teoretice.nextval,341,504,to_date('10/02/2021','DD/MM/YYYY'),'Chestionare');

select *
from lectie_teoretica;
------------------------------------------------------------------------------
create table PREZENTA(
id_lectie number(5) constraint prezenta_lectie_nn not null,
id_elev number(5) constraint prezenta_elev_nn not null,
foreign key (id_lectie) references lectie_teoretica(id_lectietr),
foreign key (id_elev) references client(id_client)
);

insert into prezenta
values (3000,1002);
insert into prezenta
values (3000,1003);
insert into prezenta
values (3002,1002);
insert into prezenta
values (3003,1002);
insert into prezenta
values (3003,1003);
insert into prezenta
values (3001,1000);
insert into prezenta
values (3004,1001);
insert into prezenta
values (3004,1003);
insert into prezenta
values (3003,1001);
insert into prezenta
values (3002,1000);

select *
from prezenta;
------------------------------------------------------------------------------
create table EXAMEN(
id_examen number(5) constraint examen_id_pk primary key,
id_elev number(5) constraint examen_elev_nn not null,
data date constraint examen_data_nn not null,
calificativ varchar2(10) constraint examen_cal_nn not null,
foreign key (id_elev) references CLIENT(id_client),
constraint CHK_CAL CHECK (lower(calificativ) in ('admis','respins'))
);

create sequence examene
start with 3500
increment by 1;

insert into examen
values (examene.nextval,1000,to_date('27/11/2019','DD/MM/YYYY'),'Admis');
insert into examen
values (examene.nextval,1000,to_date('13/01/2020','DD/MM/YYYY'),'Admis');
insert into examen
values (examene.nextval,1001,to_date('13/05/2020','DD/MM/YYYY'),'Respins');
insert into examen
values (examene.nextval,1001,to_date('25/07/2020','DD/MM/YYYY'),'Respins');
insert into examen
values (examene.nextval,1001,to_date('27/08/2020','DD/MM/YYYY'),'Admis');
insert into examen
values (examene.nextval,1002,to_date('14/05/2020','DD/MM/YYYY'),'Respins');
insert into examen
values (examene.nextval,1002,to_date('27/05/2020','DD/MM/YYYY'),'Respins');
insert into examen
values (examene.nextval,1003,to_date('10/07/2020','DD/MM/YYYY'),'Admis');
insert into examen
values (examene.nextval,1003,to_date('11/07/2020','DD/MM/YYYY'),'Respins');
insert into examen
values (examene.nextval,1003,to_date('23/09/2020','DD/MM/YYYY'),'Admis');

select *
from examen;
------------------------------------------------------------------------------
create table TEORETIC(
id_examen number(5) constraint examen_teoretic_pk primary key,
punctaj number(2) constraint teoretic_punct_nn not null,
foreign key (id_examen) references examen(id_examen)
);

insert into teoretic
values (3500,23);
insert into teoretic
values (3502,19);
insert into teoretic
values (3503,20);
insert into teoretic
values (3504,22);
insert into teoretic
values (3505,16);

select *
from teoretic;
------------------------------------------------------------------------------
create table PRACTIC(
id_examen number(5) constraint examen_practic_pk primary key,
puncte_penalizare number(3) constraint pct_nn not null,
foreign key (id_examen) references examen(id_examen)
);

insert into practic
values (3501,5);
insert into practic
values (3506,36);
insert into practic
values (3507,19);
insert into practic
values (3508,102);
insert into practic
values (3509,0);

select *
from practic;
------------------------------------------------------------------------------