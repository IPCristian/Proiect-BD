-----------------------------------------------------------------------
-- Punctul 11
-----------------------------------------------------------------------
-- Sa se afiseze nume si prenumele elevului, instructorului si marca --
-- de masina tuturor lectiilor practice ce au avut loc dupa 24 Iulie --
-- 2020                                                              --
-----------------------------------------------------------------------
select c.nume,c.prenume,aa.nume,aa.prenume, a.marca, l.data
from client c,lectie_practica l,automobil a,instructor i, angajat aa
where (c.id_client = l.id_elev)
and (a.id_automobil = l.id_automobil)
and (i.id_angajat = l.id_instructor)
and (i.id_angajat = aa.id_angajat)
and (l.data > to_date('24/07/2020','DD/MM/YYYY')) 
order by 6; 
---------------------------------------------------------------------
-- Sa se afiseze numele, prenumele si numarul de examene date al   --
-- fiecarui client                                                 --
---------------------------------------------------------------------
select nume,prenume, (select count(*)
                      from examen e
                      where e.id_elev = c.id_client) "Nr. Examene"
from client c
---------------------------------------------------------------------
-- Sa se afiseze numele, prenumele, adresa, emailul si             -- 
-- codul sediului tuturor angajatilor care lucreaza ca secretar    -- 
-- si celor carora nu le este setat email-ul, sa se afis in schimb --
-- mesajul Mail Nesetat                                            --
---------------------------------------------------------------------
select a.nume,a.prenume,o.denumire,aa.info_adresa,s.id_sediu, nvl(a.email,'Mail Nesetat')
from angajat a,secretar s,adresa aa,oras o
where (a.id_angajat = s.id_angajat)
and (a.id_adresa = aa.id_adresa)
and (aa.id_oras = o.id_oras);
---------------------------------------------------------------------
-- Sa se afiseze numele, prenumele si rangul tuturor instructorilor -
-- Rangul se calculeaza astfel; <10 ani cu carnet => Incepator
-- <20 ani cu carnet => Intermediar
-- >=20 ani cu carnet => Avansat
---------------------------------------------------------------------
select a.nume,a.prenume,
CASE
    WHEN 2021-extract(year from i.data_carnet)<10 THEN 'Incepator'
    WHEN 2021-extract(year from i.data_carnet)<20 THEN 'Intermediar'
    ELSE 'Avansat'
END AS Rang
from angajat a,instructor i
where (a.id_angajat = i.id_angajat);
---------------------------------------------------------------------
-- Sa se afiseze angajatii ce au un nume mai mic de 4 litere sau   --
-- care au prenumele incepand cu litera T                          --
---------------------------------------------------------------------
select nume,prenume
from angajat a
where (length(a.nume)<4)
or (lower(a.prenume) like 't%');
---------------------------------------------------------------------
-- Sa se afiseze id-urile sediilor precum si codurile lor interne  --
---------------------------------------------------------------------
select sediu.id_sediu, decode(sediu.id_sediu,500,'Alpha'
                            ,501,'Beta'
                            ,502,'Charlie'
                            ,503,'Delta'
                            ,504,'Foxtrot') Cod
from sediu;
---------------------------------------------------------------------
-- Sa se afiseze totii instructorii care au utilizat automobilul cu--
-- id-ul 750 la orele de pregatire practica                        --
---------------------------------------------------------------------
select angajat.nume,angajat.prenume
from angajat
where (angajat.id_angajat in (select id_angajat
                              from instructor
                              where (id_angajat in (select id_instructor
                                                       from lectie_practica
                                                       where (id_automobil = 750)))));
---------------------------------------------------------------------
-- Sa se afiseze totii instructorii care au utilizat automobile cu --
-- marca Honda la orele de pregatire practica cu elevul cu numele  --
-- 'Lavinia'                                                       --
---------------------------------------------------------------------
select angajat.nume,angajat.prenume
from angajat
where (angajat.id_angajat in (select id_instructor
                              from lectie_practica l, client c, automobil a
                              where (lower(a.marca) = 'honda')
                              and (lower(c.nume) = 'lavinia')
                              and (c.id_client = l.id_elev)
                              and (a.id_automobil = l.id_automobil)));
---------------------------------------------------------------------
-- Sa se afiseze id-ul tuturor lectiilor practice la care au       --
-- participat clienti ce au semnat un contract cu secretarul cu    --
-- id-ul 346                                                       --
---------------------------------------------------------------------
select l.id_lectiepr
from lectie_practica l
where (l.id_elev = (select id_client
                     from client c
                     where (c.id_client = l.id_elev)
                     and (c.id_client = (select cc.id_client
                                          from contract cc
                                          where (cc.id_secretar = 346)
                                          and (cc.id_client = c.id_client)))));
---------------------------------------------------------------------
-- Sa se afiseze id-ul secretarului care a realizat contractul la  --
-- care a fost realizata plata cu id-ul 2502 si care a fost semnat --
-- de clientul cu id-ul 1002                                       --
---------------------------------------------------------------------                                                                  
select id_angajat
from secretar s
where (s.id_angajat = (select c.id_secretar
                       from contract c, client cc, plata p
                       where (c.id_client = cc.id_client)
                       and (c.id_secretar = s.id_angajat)
                       and (p.id_contract = c.id_contract)
                       and (cc.id_client = 1002)
                       and (p.id_plata = 2502)
                       ));                                                                             
---------------------------------------------------------------------     
-- Sa se afiseze (daca si numai daca exista cel putin 4 astfel de examene)
-- numarul de examene ce au calificativul respins si data celui mai recent
-- cat si numarul de examene cu calificativul admis si data celui mai recent
---------------------------------------------------------------------
select calificativ,max(data),count(*)
from examen
group by calificativ
having count(*)>4;
---------------------------------------------------------------------
-- Sa se afiseze numarul maxim de lectii practice existente in aceeasi zi
---------------------------------------------------------------------
select max(count(*))
from lectie_practica
group by data;
---------------------------------------------------------------------
-- Stiind adresele tuturor angajatilor, sa se afiseze clientii
-- care locuiesc la aceeasi adresa cu un angajat
---------------------------------------------------------------------
with TabelTemp as
(select distinct id_adresa as id_ad
from angajat)
select c.nume,c.prenume
from client c
where (c.id_adresa in (select id_ad from TabelTemp));
-----------------------------------------------------------------------
-- Punctul 12
-----------------------------------------------------------------------
rollback;
-----------------------------------------------------------------------
update angajat
set email = null      -- Stergerea emailurilor tuturor angajatiilor 
where (id_angajat in (select id_angajat
                      from prof_legis))-- care lucreaza ca profesori de legislatie
-----------------------------------------------------------------------
update client   -- Schimbarea numelui clientilor 
set nume = 'Ion'  -- in Ion tuturor clientilor care 
where prenume like '%r%'  -- au litera 'r' in prenume
and (id_adresa in (select id_adresa  -- si care locuiesc la o adresa din
                   from adresa  -- orasul cu id-ul 4
                   where (id_oras = 4)))
-----------------------------------------------------------------------
update secretar -- Schimbarea sediului unui secretar
set id_sediu = &id   -- intr-un sediu ales de la tastatura
where (id_angajat in (select distinct id_secretar
                       from contract)) -- la secretarii ce au facut
                                       -- macar un contract
-----------------------------------------------------------------------
insert into oras
values (25,'Botosani');

delete  -- Se sterg toate orasele care nu au vreo adresa la ele
from oras
where (id_oras not in (select id_oras from adresa));
-----------------------------------------------------------------------
delete
from automobil  -- Se sterg din sistem masinile neutilizate la orele de pregatire practica
where (marca not in (select distinct marca from automobil a,lectie_practica l where a.id_automobil=l.id_automobil))
-- Este sters 751
-----------------------------------------------------------------------
delete 
from plata
where (id_contract in (select id_contract -- Stergerea platiilor facut de clientul cu id-ul
                       from contract      -- ales de la tastatura
                       where (id_client = &idc)));
-----------------------------------------------------------------------