%Libreria para realizar el modo gráfico en Prolog
:- use_module(library(pce)).
% Libreria que me permite crear, etiquetas, botones y otros elementos
% para el SE.:- use_module(library(pce style item)).
:- use_module(library(pce_style_item)).
%


%En esta sección encontraremos el menu principal del SE.
menu_principal :- %regla que nos permite crear objetos
    new(Main, dialog('DIAGNOSTICO DE ENFERMEDADES BUCODENTALES',size(1000,800))),
    new(L, label(nombre,'CONSULTA ODONTOLOGICA')),
    new(A, label(nombre,'Desarrollado por: Santiago Cesario Ramos Vicente')),

    new(@texto, label(nombre,'Responda las siguientes preguntas que serviran para
    evaluar su diagnostico')),
    new(@respuesta,label(nombre,'')),

    new(Salir,button('SALIR',and(message(Main,destroy),message(Main,free)))),

    new(@boton,button('REALIZAR DIAGNOSTICO',message(@prolog,botones))),

    %Crear el tamaño de cada boton y de cada Label
    send(Main, append(L)), new(@btncarrera,button('¿DIAGNOTICO?')),
    send(Main, display,L,point(125,20)),
    send(Main, display,A,point(20,75)),
    send(Main, display,@boton,point(100,150)),
    send(Main, display,@texto,point(20,100)),
    send(Main, display,Salir,point(20,400)),
    send(Main, display,@respuesta,point(20,130)),
    send(Main,open_centered),
    send(@texto,font,font(comic,bold,10)),
    send(L,font,font(comic,bold,20)).
% Estas seran las enfermedades para diagnosticar dependiendo de los
% sintomas que presenten los pacientes.

patologias('SEGÚN SUS SINTOMAS PADECE: CARIES
            TRATAMIENTO:
            Acudir al dentista, el determinará qué tratamiento
            es el más adecuado según su estado de desarrollo.
            Cuanto más tiempo pase, mayor ataque habrá sufrido
            el diente y mayor deberá ser la intervención del dentista.
            Por lo tanto, es mejor poner remedio lo antes posible
            para mantener la salud dental.
            El tratamiento puede ayudar a impedir que el daño a los
            dientes lleve a caries dentales crónicas.
            El tratamiento puede involucrar:
                  Obturaciones
                  Coronas
                  Tratamiento de conducto
            '):-caries,!.

patologias('SEGÚN SUS SINTOMAS PADECE: GINGIVITIS
            TRATAMIENTO:
            El objetivo es reducir la inflamación.
            El odontólogo o el higienista oral le harán una limpieza
            de los dientes. Ellos pueden emplear diversos instrumentos
            para aflojar y remover los depósitos de los dientes.
            Es necesaria una higiene oral cuidadosa después de una
            limpieza dental profesional. El odontólogo o el higienista oral
            le mostrarán a usted cómo cepillarse y usar la seda dental.
            El odontólogo puede recomendar:
                  Hacerse una limpieza dental profesional, además del
                 cepillado y uso de la seda dental dos veces al año o con más
                 frecuencia para casos graves de enfermedad periodontal.
                  El uso de enjuagues bucales antibacterianos
                 u otro tipo de ayudas.
                  La reparación de los dientes desalineados.
                  El reemplazo de los aparatos dentales y ortodóncicos
            '):-gingivitis,!.

patologias('SEGÚN SUS SINTOMAS PADECE: PERIODONTITIS
            TRATAMIENTO:
             El objetivo del tratamiento es reducir la inflamación,
            eliminar las "bolsas" en las encías y tratar cualquier
            causa subyacente de la enfermedad periodontal.
             Se deben reparar las superficies ásperas
            de los dientes o los aparatos dentales.
             Los pacientes con periodontitis deben hacerse
            una limpieza dental profesional cada tres meses.
             La cirugía puede ser necesaria. Es posible que se requiera
            abrir y limpiar las bolsas profundas en las encías y brindar
            soporte a los dientes flojos. Asimismo, es probable que el
            odontólogo tenga que extraer uno o varios dientes, de manera
            que no se propague a los dientes adyacentes.
             Es de importancia suprema para la progresión
            de la enfermedad periodontal antes que cause
            daño adicional a los tejidos de la encía y a la quijada.
             El dentista examinara la boca entera para determinar
            y comprobar el progreso de la enfermedad.
            '):-periodontitis,!.

patologias('SEGÚN SUS SINTOMAS PADECE: ULCERAS
            TRATAMIENTO:
             La limpieza de las prótesis dentales es importante
              para prevenir problemas inducidos por las mismas.
             Es útil quitarse la prótesis por la noche.
             Si la causa es el uso de antibióticos o anticonceptivos orales,
              quizá deba reducir la dosis o cambiar el tratamiento.
             Existen sustitutos de saliva para tratar la sequedad bucal.
             Cuando la causa subyacente es inevitable o incurable,
              puede utilizar medicamentos antimicóticos.
             La correcta higiene bucal es fundamental.
             Acudir al dentista, el determinará qué tratamiento
              es el más adecuado según su estado de desarrollo de la ulcera.
            '):-ulceras,!.

patologias('Enfermedad desconocida').

caries:- tiene_caries,
pregunta('¿Presenta infección o absceso dental?'),
pregunta('¿Presenta dolor en la pieza dental o muelas?'),
pregunta('¿Presenta sensibilidad o molestia al comer bebidas o alimentos frios y calientes?'),
pregunta('¿Presenta sensibilidad o molestia al comer bebidas o alimentos dulces?'),
pregunta('¿Presenta hoyuelos o agujeros visibles en los dientes?').

gingivitis:- tiene_gingivitis,
pregunta('¿Presencia sangrado en las encias al usar el hilo dental?'),
pregunta('¿Presencia de una apariencia roja brillante o roja pupura en las encias?'),
pregunta('¿Presencia de inflamación en sus encias?'),
pregunta('¿Presencia de sensibilidad en sus encias?'),
pregunta('¿Presencia de ulceras bucales?').

periodontitis:- tiene_periodontitis,
pregunta('¿Presenta mal aliento?'),
pregunta('¿Presenta una apariencia roja brillante o roja pupura en las encias?'),
pregunta('¿Presenta sangrado en las encias al cepillarse?'),
pregunta('¿Presenta sangrado en las encias al usar el hilo dental?'),
pregunta('¿Presenta sensibilidad al tacto, pero por lo demas no duele?'),
pregunta('¿Presenta pus entre los dientes y encias?'),
pregunta('¿Presenta dientes flojos?').

ulceras:- tiene_ulceras,
pregunta('¿Presencia de dolor en la lengua, labios o mucosa?'),
pregunta('¿Presencia de quemazón en la lengua, labios o mucosa?'),
pregunta('¿Presencia de heridas de color blanco en la lengua, labios o mucosa?'),
pregunta('¿Presencia de fiebre o malestar en general?').

desconocido:- enfermedad_desconocida.

tiene_caries:- pregunta('¿Presenta cambio de color en alguna pieza dental?'),!.
tiene_gingivitis:- pregunta('¿Presencia sangrado en las encias al cepillarse?'),!.
tiene_periodontitis:- pregunta('¿Presenta un aspecto brillante en sus encias?'),!.
tiene_ulceras:- pregunta('¿Presencia de ampollas en la lengua, labios o mucosa?'),!.

% El siguiente proceso nos define el diagnostico de las enfermedades
% basado en las preguntas de si o no. Como sabemos definimos algunas
% preguntas especificas que nos permiten seguir el camino por una
% enfermada particular si el usuario contesta afirmativamente es decir
% "SI" en caso de ser lo contrario "No" saltara al camino de la
% siguiente enfermedad.

:-dynamic si/1,no/1.
preguntar(Problema):-new(Di,dialog('SISTEMA EXPERTO DIAGNOSTICO DE ENFERMEDADES BUCODENTALES')),
    new(L2,label(texto,'Responde las suguientes preguntas:')),
    new(L3,label(problem,Problema)),
    %Creación de los botones SI / NO
    new(BOTON1,button(si,(message(Di,return,si)))),
    new(BOTON2,button(no,(message(Di,return,no)))),
        send(Di,append(L2)),
        send(Di,append(L3)),
        send(Di,append(BOTON1)),
        send(Di,append(BOTON2)),

        send(Di,default_button,si),
        send(Di,open_centered),get(Di,confirm,Answer),
        write(Answer),send(Di,destroy),
        ((Answer==si)->assert(si(Problema));
        assert(no(Problema)),fail).

% Cada vez que el paciente conteste una pregunta se limpia la pantalla
% para volver a preguntar el siguiente sintoma.
pregunta(S):-(si(S)->true; (no(S)->fail; preguntar(S))).
limpiar:-retract(si(_),fail).
limpiar:-retract(no(_),fail).
limpiar.


botones:-lim,
           send(@boton,free),
           send(@btncarrera,free),
           patologias(Enfer),
           send(@respuesta, selection(Enfer)),
           send(@respuesta,font,font(comic,bold,12)),
           new(@boton,button('Iniciar su evaluación',message(@prolog,botones))),
           send(Menu,display,@boton,point(40,20)),
           send(Menu,display,@btncarrera,point(20,50)),
limpiar.
lim:-send(@respuesta,selection('')).







