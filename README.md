# sql Checkpoint 2

Esse projeto é de um banco de dados de uma empresa de delivery fictícia.

|  Entidades |
| ------ |
| status |
| vehicles |
| products |
| users |
| drivers |
| stores |
| orders |
| orders_x_products |

OBS: As entidades de status, vehicles, products todas tem o atributo name como unique para para evitar dados duplicados.

A entidade orders_x_products é uma tabela intermediária que permite que um pedido (orders) tenha mais um produtos (products)
