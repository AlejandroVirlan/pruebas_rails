def divisiones_array(n_filas)
    
    array_letras = ('a'..'l').to_a
    n_letras = array_letras.length
    n_columnas = n_letras / n_filas
    aux_fila = 0
    aux_columna = 0
    pos_letra = 0
    aux_contador = 0
    
    # Comprobación de si es divisible o no para redondear las columnas 
    if (n_letras % n_filas != 0)
        n_columnas += 1
    end
    
    # Establecemos el tamaño de la matriz
    array_subdivisiones = Array.new(n_filas) {Array.new(n_columnas)}
    
    # Recorremos el array de letras
    while (pos_letra < n_letras) do
        
        # Asignamos la letra del array en la que estamos (pos_letra) a una posición de la matriz
        array_subdivisiones[aux_fila][aux_columna] = array_letras[pos_letra]
        
        # Comprobamos si es divisible o no para poder cambiar de fila y/o columna
        if ((pos_letra + 1) % n_filas == 0)
            aux_fila = 0
            aux_columna += 1
        else
            aux_fila += 1
        end
        
        pos_letra += 1
    end
        
    # 1ª forma de demostración 
    for i in array_subdivisiones
        print i
        puts
    end
    
    # 2ª forma de demostración 
    puts
    print array_subdivisiones
    
end

divisiones_array(3)