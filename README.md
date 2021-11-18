# Lab-IOCLA

Laborator 01: Reprezentarea numerelor, operații pe biți și lucru cu memoria
-----
***Grup de 8 biți formează un octet (byte).
  XOR - ac valoare => 0, altfel 1.
În sistemul hexazecimal (baza 16), valorile sunt reprezentate sub forma unui șir de caractere din intervalul '0'-'9' sau 'a'-'f'. Un octet este format din două astfel de caractere, deci fiecare caracter corespunde unui grup de 4 biți (un nibble).
În memoria unui calculator o valoare este memorată pe un număr fix de biți. În funcție de arhitectură fiecare procesor poate accesa un număr maxim de biți în cadrul unei operații, acest număr de biți reprezintă dimensiunea cuvântului (word size).***


Laborator 02: Operații cu memoria. Introducere în GDB
-----
***Pointeri la void
Un pointer la void este un pointer care nu are un tip asociat. Pointerii la void au o flexibilitate mare deoarece pot pointa la orice tip de date, dar au și o limitare la fel de mare, și anume că nu pot fi dereferențiați, iar pentru a putea fi folosiți în operații cu pointeri trebuie convertiți la un tip de date cunoscut.
Interpretarea datelor din memorie
Pe cele mai multe calculatoare moderne, cea mai mică unitate de date care poate fi adresată este byte-ul/octetul (8 biți), acest lucru însemnând că putem privi datele în memorie drept o înșiruire de bytes, fiecăruia corespunzându-i o adresă. In cazul în care dorim să stocăm o informație reprezentată pe mai mulți octeți va trebui să ținem cont de ordinea impusă de arhitectura sistemului, denumită endianness.
Dacă o funcție returnează adresa unei variabile locale este obligatoriu ca aceasta să fie statică. Durata de viață a unei variabile locale se încheie odată cu terminarea execuției funcției în care a fost definită și de aceea adresa unei astfel de variabile nu trebuie transmisă în afara funcției.
Numele unei funcții reprezintă adresa de memorie la care începe funcția. Un pointer la o funcție este o variabilă ce stochează adresa unei funcții ce poate fi apelată ulterior prin intermediul acelui pointer. Uzual, pointerii la funcții sunt folosiți pentru a trimite o funcție ca parametru unei alte funcții.***

Laborator 03: Toolchain
-----

Laborator 06: Lucrul cu stiva
-----
***La folosirea instructiunii popa, responsabila pentru restaurarea registrelor, valoare lui eax va fi pierduta.**
Stiva creste de la adrese mari la adrese mici. Acesta este motivul pentru care alocarea memoriei pe stiva se face folosind instructiunea sub, iar eliberarea se face folosind instructiunea add.
**Asadar, instructiunea push eax, pe un procesor x86, este echivalenta cu:
sub esp, 4; 
mov [esp], eax. 
Iar instructiunea pop eax:
mov eax, [esp]; 
add esp, 4.***

Laborator 07: Apeluri de funcții
-----
***Atunci când apelăm o funcție, pașii sunt următorii:
Punem argumentele pe stivă, apelul de tip push fiind în ordinea inversă în care sunt trimiși ca argumente funcției. Apelăm call. Restaurăm stiva la sfârșitul apelului.***

***Apelul call poate fi echivalat cu urm secventa : push eip ; jmp function_name - se intampla la nivelul apelantului(caller). Adică și apelul call folosește în continuare stiva și salvează adresa -------următoarei instrucțiuni--------, cea de după call numită și instrucțiunea de retur sau adresa de retur (return address). Aceasta este necesară pentru a ști, în apelat, unde să revenim. 
Suplimentar, în apelat, la începutul său (numit preambul, preamble) se salvează frame pointer-ul (în arhitectura i386 este vorba de registrul ebp) urmând ca frame pointer-ul să refere adresa curentă de pe stivă (adică tocmai fostul frame pointer). 
Deși nu este obligatorie, salvarea frame pointer-ului ajută la debugging și este în cele mai multe cazuri folosită. Din aceste motive, orice apel de funcție va avea în general, preambulul: push ebp (si) mov ebp, esp.
Aceste modificări au loc în apelat. De aceea este responsabilitatea apelatului să restaureze stiva la vechea sa valoare. De aceea este uzuală existența unui epilog care să readucă stiva la starea sa inițială; acest epilog este: leave.
În acest moment stiva este ca la începutul funcției, adică imediat după call, referind adresa de retur. Urmează apelul: ret - care este echivalentul instrucțiunii: pop eip.***






