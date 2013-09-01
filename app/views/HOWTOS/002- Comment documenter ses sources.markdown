Comment documenter les sources
==============================


Conditions RPG
--------------
Afin que la documentation soit générer les blocs documentaires doivent respecter certaines conditions

- Il doit y avoir au moins un tag \brief 

- Le bloc documentaire d'un PROGRAM doit précéder la carte H

- there must be at least one H (eader) entry in the program to be (can also be a copy-way)

- Le bloc documentaire des PROCEDURE doit précédent directement  the statement of procedure P

- Un bloc document est toujours initié par /** et terminé par */

- Les tags doivent commencer en colonne 9
  - scdksdcs

ekekldned
kldnedkl


Conditions CL
-------------
Afin que la documentation soit générer les blocs documentaires doivent respecter certaines conditions

- Il doit y avoir au moins un tag \brief

- the comment block depends on fi ¿½ and ends with / *** /


_(Note: the position of the text play no role in CL programs.)_



Notes for documenting RPG
-------------------------

- Upper and lower case is fi ¿½ s the data in column 7 (Specs) ignored

- File names are also lowercase Ki ¿½ can

- Programs and procedures without comment block can not be displayed

- the day \main does not work in the comment block in procedures

- on a tag must follow a text. Exception: \ critical and \ service program

* * *

Les Tags
--------

**\author**    
    Nom de l'auteur du programme ou de la procédure.
     
_Example:_

~~~~~
\author Taka Plotter
~~~~~


**\brief** 
   Résumé concis du programme ou de la procédure __(mandatory)__
     
     _Example:_

~~~~~
\brief Récupère les prestations de l'offre active
~~~~~


**\date**
    La date de création
     
     _Example:_

~~~~~
\date 07/12/2012
~~~~~

**\param**
    Description d'un paramère
     
     _Example:_ 

~~~~~
\param item_number (DAN)
~~~~~

**\return**
    Description du retour d'une procédure (plusieurs lignes possibles)
     
     _Example:_

~~~~~
\return *on = successfully 
        *off = error
~~~~~

**\todo**   
    Description d'une tache à faire (plusieurs lignes possibles)
     
     _Example:_ 

~~~~~
\todo If you have tasks in the program or 
in the procedure has open, you want to write anyway, 
you can do so here over multiple lines.
~~~~~

**\link**   
     A hyperlink to a file. The URL must be entered without spaces. Possibly replace spaces with% 20th The description must be separated from the URL by a space. The description of the link can contain spaces.
     
     _Example:_

~~~~~
\link http://hier.sollte.die.url.stehen/zu-dem-dokument/index.html description of the hyperlink
~~~~~


**\warning**    
    A text to indicate the programming on certain things.
     
     _Example:_

~~~~~
\warning  Les options de compilation sont différentes. Voir dans \Info
~~~~~

**\info**   
    A text to inform the programming ï ¿½ about certain things.
     
     _Example:_ 

~~~~~
\info  Toutes informations bonnes à savoir pour le programmeur qui vient derrière moi.. 
       (Plusieurs lignes possibles)
~~~~~

**\rev**   
     A text that change the ï ¿½ lists the program. The first line is the date and the programmer. The date must not contain any spaces. Is the short summary description of the ï ¿½ change at all following lines.
     
     _Example:_ 

~~~~~
\rev 02/10/2006 Taka Fokon
       L'explication de la modification. Avec Son numéro de FIX 
       (Plusieurs lignes possibles)
~~~~~

**\deprecated**
     Obsolete: This program or this procedure should not be used. ï ¿½ berlicherweise the reason is given and a workaround or the program or procedure that this has now been replaced.
     
     _Example:_ 

~~~~~
\deprecated This procedure was replaced by the procedure procSQL. The data access is now done via SQL.
~~~~~

**\critical**   
     If the program was classified as critical, this day is to be registered. There is no need Zusi ¿½ tzlicher text is recognized.


Markdown
--------
NODocs utilise [Redcarpet](https://github.com/vmg/redcarpet) pour formatter la documentation.
Redcarpet se base sur Markdown un language de markup permettant d'être facilement lisible et convertible en HTML. 
Vous trouverez sur [wikipedia](http://en.wikipedia.org/wiki/Markdown) des exemples syntaxiques de markup.

pour afficher `**en gras**` un mot ou une phrase importante

Les markup spécifiques à NODoc
------------------------------

*Markdown impose un \r\n entre chaque markup. Sur l'AS400 nous utiliserons le symbole $ pour remplacer le \r\n*  


- Les blocs délimtés avec 3 ou plus `~` ou backticks seront considérés comme des lignes de code.

~~~~~
    $~~~~~
    $call mon_prog parm('parm1' 'parm2')
    $~~~~~
~~~~~

- Les phrases délimtées par un `~` ou backticks seront considérés comme une ~ligne de code~.

~~~~~
  $~ligne de code~$
~~~~~

donne ~ligne de code~

- Les titres

~~~~~
$# Premier niveau de titre
$#### quatrième niveau de titre
~~~~~

- Les puces

~~~~~
$ - Premier niveau 
$ - même niveau 
$   - deuxième niveau 
$     - Troisième niveau
~~~~~

donne :

- Premier niveau 
- même niveau 
  - deuxième niveau 
    - Troisième niveau


Exemple de bloc documentaire
----------------------------

~~~~~
    /**
     * \brief résumé explicite de la fonction ou du programme vsur une ligne seulement
     *$
     *$ ici taper directement la documentation relative au code.
     *$
     *$
     *$
     *$ le signe $ permet de sauter une ligne (comme un \r\n):
     *$ 
     *$ exemple:
     *$
     *$ Procédure permettant de récupérer le n° client de l'offre, à savoir:
     *$$ 
     *$ - le code société$ 
     *$ - le n° client au sens du PF15.NULO$
     *$   - sous niveau de puce
     *$
     *$
     *$ Le code société et le n° client sont retournés en paramètres de  sortie
     *$
     *$
     *$ _Exemple :_
     *$
     *$ Retourner le n° de client de l'offre n°8755141 
     *$
     *$~~~~~
     *$ QUOTE_getSLANumber(8755141:codeSociete:numeroClient:DSError)
     *$~~~~~
     *$
     *$
     * \author Mihael Knezevic
     * \date   01/05/2006
     *
     * \todo Vous pouvez écrire un Todo. Il peut tenir sur plusieurs 
     *       lignes. Ce qui permet d'être plus précis dans la description
     *       du Todo.
     *
     * \warning taper ici tout avertissement à savoir avant d'utiliser cette fonction
     *          Cela tient sur plusieurs lignes également
     *
     * \info des infos complémentaires qui tiennent sur 
     *       plusieurs lignes aussi
     *
     * \rev 02.10.2006 Mihael Knezevic
     *      révision apportée (mettre le numéro de fix)
     *
     * \rev 02.02.2013 Peter Stuvesant
     *      révision apportée (mettre le numéro de fix)
     *
     * \param \input paramètre_en_entré
     * \param \output parmètre_en_sortie
     */
~~~~~