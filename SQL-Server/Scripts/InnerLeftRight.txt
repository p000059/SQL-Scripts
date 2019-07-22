Se você é programador, trabalha com banco de dados e não sabe utilizar INNER JOIN, LEFT JOIN e RIGHT JOIN, este artigo foi preparado especialmente para que você aumente seu conhecimento em programação, especificamente em banco de dados e SQL.
Há anos realizo consultorias e desenvolvimentos em sistemas de médio e grande portes. Mesmo sendo sistemas utilizados no mercado nacional e internacional, eles tiveram um começo e muitas vezes o começo é a causa de grandes problemas no futuro. A falta de instrução gera lentidão e esses problemas são ocasionados por falta de conhecimento e acabam se tornando um monstro para muitos programadores.
O uso dos JOIN é essencial para a manipulação de dados entre tabelas no banco de dados. O correlacionamento entre tabelas deve ser modelado de forma correta para que o conteúdo seja obtido corretamente. Sendo assim, preparei um exemplo que fará com que você entenda e possa replicar o uso correto dos JOIN em seus projetos.
Exemplo
Imagine um sistema de frotas para entrega de produtos como a empresa Amazon, por exemplo. Um mesmo caminhão pode realizar diversas entregas e para isso o correlacionamento entre tabelas pode variar de acordo com necessidade dos dados que se quer obter. Crie em seu banco de dados as tabelas abaixo e analise-as antes de continuarmos.
**tbl_caminhoes**
– campo 1: id_caminhao – INT (Autoincrement)
– campo 2: placa – varchar(45)
– campo 3: motorista – varchar(45)
**tbl_entregas**
– Campo 1: id_entrega – INT (Autoincrement)
– Campo 2: id_caminhao – INT
– Campo 3: endereco – varchar(45)
– Campo 4: horario – varchar(45)
Quando usar o INNER JOIN
Listaremos todas as entregas e os caminhões que farão cada entrega. Porém, se a entrega não possuir um caminhão, ela não sera exibida no resultado desta pesquisa. Veja a query no exemplo abaixo:
“`
SELECT
tbl_entregas.id_entrega,
tbl_entregas.id_caminhao,
tbl_entregas.endereco,
tbl_entregas.horario,
tbl_caminhoes.nome,
tbl_caminhoes.placa,
tbl_caminhoes.motorista
FROM tbl_entregas
INNER JOIN tbl_caminhoes ON tbl_caminhoes.id_caminhao = tbl_entregas.id_caminhao
“`
Quando usar o LEFT JOIN
Utilizando LEFT JOIN, listaremos todas as entregas, independentemente se elas possuem ou não um caminhão correlacionado, através do id_caminhao de ambas as tabelas. Veja como ficou a query abaixo:
“`
SELECT
tbl_entregas.id_entrega,
tbl_entregas.id_caminhao,
tbl_entregas.endereco,
tbl_entregas.horario,
tbl_caminhoes.nome,
tbl_caminhoes.placa,
tbl_caminhoes.motorista
FROM tbl_entregas
LEFT JOIN tbl_caminhoes ON tbl_caminhoes.id_caminhao = tbl_entregas.id_caminhao
“`
No exemplo acima, as colunas: nome, placa e horário da tbl_caminhoes irão retornar o valor NULL quando não encontradas.
Quando usar o RIGHT JOIN
No caso do RIGHT JOIN, primeiro serão todas as entregas que têm caminhões. Com isso, você irá perceber uma mudança no resultado, pois eles virão ordenados pela tbl_caminhoes, caso não tenha definido nenhuma ordenação especial.
“`
SELECT
tbl_entregas.id_entrega,
tbl_entregas.id_caminhao,
tbl_entregas.endereco,
tbl_entregas.horario,
tbl_caminhoes.nome,
tbl_caminhoes.placa,
tbl_caminhoes.motorista
FROM tbl_entregas
RIGHT JOIN tbl_caminhoes ON tbl_caminhoes.id_caminhao = tbl_entregas.id_caminhao
“`
O uso correto dos JOIN com certeza trará benefícios à performance de suas aplicações. Boa sorte e continue aprendendo cada vez mais. Conhecimento é essencial para se tornar um grande programador.