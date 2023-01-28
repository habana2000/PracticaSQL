-- ******************************
-- *****   SQL - Consulta   *****
-- ******************************
-- Xavi Roca
-- JAN.23

select g.nombre_grupo, ma.nombre_marca, m.nombre_modelo, v. fecha_compra, v.matricula, c.nombre_color, v.km , a.nombre_aseguradora, v.poliza
from xaviroca_schema.grupos g
	left join xaviroca_schema.marcas ma on g.idGrupo = ma.grupo     -- para que salgan todos los grupos, aunque no tengan marcas
	left join xaviroca_schema.modelos m on ma.idMarca = m.marca		-- para que salgan todas las marcas, aunque no tengan modelos
	left join xaviroca_schema.vehiculos v on m.idModelo = v.modelo	-- para que salgan todos los modelos, aunque no tengan vehículos
	left join xaviroca_schema.colores c on c.idColor = v.color 
	left join xaviroca_schema.aseguradoras a on a.idAseguradora = v.aseguradora
where v.fecha_baja is null 		-- para que sólo salgan los activos
order by 1,2,3;





