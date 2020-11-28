//Creado por Aquino Santiago Rogelio Gerardo
//Para la clase de Computo movil
//Fecha: 28/11/2020

/*
  Estructura Alumno la cual guardara el nombre, edad, promedio y si es becario o no.
  Datos
    n: Nombre del alumno
    e: Edad del alumno
    p: Promedio del alumno
    b: ¿Es becario?*/
struct alumno{
	let n: String
	let e: Int
  let p: Double
  let b: Bool
}
/*
  Función que recibirá el numero de alumno que se trata, e internamente, escaneará los datos que el usuario necesite, además de convertir las cadenas en los datos necesarios, para devolverlo.
  Ingresa
    i:Numero de alumno
  Devuelve
    String:Nombre del Alumno
    Int: Edad del alumno
    Double: Promedio del alumno
    Bool: ¿Es becario?*/
func conAlumno(i:Int)->(String,Int,Double,Bool){
  print("Introduce el alumno",i)
  print("Nombre:")
  let n=readLine()!
  print("Edad")
  let e=readLine()!
  print("Promedio")
  let p=readLine()!
  print("¿Beca? [si=y/no=otro]")
  var b=false
  if let d=readLine(){
    if d == "y"{
      b=true}
    }
  return (n,Int(e)!,Double(p)!,b)
}
/*
  Función que imprimirá adecuadamente los alumnos dentro de la lista que solicita la función.
  Ingresa
    alumnes: Lista de alumnos*/
func printAll(alumnes:[alumno]){
  var i:Int=0
  let larg:Int=(alumnes.count)
  while i<larg{
    print("Alumno",i+1,
          "\nNombre",alumnes[i].n,
          "\nEdad",alumnes[i].e,
          "\nPromedio",alumnes[i].p,
          "\nBeca",alumnes[i].b,
          "\n\n")
    i=i+1
  }
}
/*
  Función que se encargara de recibir en loop la información recibida desde conAlumno para convertir los datos a Alumnos, además de verificar si los datos son buenos o no, en caso contrario, se borraran los datos y se reiniciara el conteo al anterior, se para hasta que el usuario ingrese al último deseado.
  Devuelve
    [alumno]: Lista de alumnos conforme fue ingresado*/
func intome() -> [alumno]{
  var alumnes: [alumno]=[]
  var i: Int=1
  var lop: Bool=true
  while lop{
    let (n,e,p,b)=conAlumno(i:i)
    print("Datos:\nNombre",n,
          "\nEdad",e,
          "\nPromedio",p,
          "\nBeca",b,
          "\n¿Es correcto? [si=y/no=otro]")
    if let d=readLine(){
      if d == "y"{
        alumnes.append(
          alumno(n:n,e:e,p:p, b:b))
        i=i+1
        print("Añadir otro? [si=y / no=otro]")
        if let d=readLine(){
          if d != "y"{lop=false}
        }
      }
    }
  }
  return alumnes
}
/*
  Función que reordenara los alumnos con base a la lista String reordenada, creara una lista de Alumnos temporal para que se inserten con forme a la lista String, devolviendo la lista Alumnos ya ordenada.
  Ingresa
    alumnes: Lista de alumnos a reordenar
    temp: Lista de los nombres ya ordenados
    larg: Tamaño de la lista
  Devuelve
    [alumno]: Lista de alumnos ya ordenados*/
func reNombres(alumnes:[alumno],temp:[String],larg: Int)->[alumno]{
  var i: Int=0
  var j: Int=0
  var alumnes2: [alumno]=[]
  i=0
  while i<larg{
    while j<larg{
      if temp[i]==alumnes[j].n{
        alumnes2.append(alumnes[j])
        j=larg
        }
      else {j=j+1}
    }
    j=0
    i=i+1
  }
  return alumnes2
}
/*
  Función que se encargara de obtener los nombres de la lista Alumno en una lista String, ordenar la lista String y llamar a la función reNombres para retornar la lista Alumno ya ordenada.
  Ingresa
    alumnes: Lista de alumnos a reordenar
  Devuelve
    [alumno]: Lista de alumnos ya ordenado alfabeticamente*/
func alfabetico(alumnes:[alumno])->[alumno]{
    var i: Int=0
    let larg: Int=alumnes.count
    var temp: [String]=[]
    while i<larg{
      temp.append(alumnes[i].n)
      i=i+1
    }
    let temp1=temp.sorted()
    return reNombres(alumnes:alumnes,temp:temp1,larg:larg)
}
/*
  Función que, dependiendo del extremo que se ingreso en los parámetros, retornara una lista Alumno con el promedio solicitado.
  Ingresa
    alumnes: Lista de alumnos
    ext: Promedio solicitado
    larg: Largo de la lista
  Devuelve
  [alumno]: lista de alumnos del promedio solicitado*/
func pExtremos(alumnes:[alumno],ext:Double,larg: Int)->[alumno]{
  var j: Int=0
  var alumnes2: [alumno]=[]
  while j<larg{
    if ext==alumnes[j].p{
      alumnes2.append(alumnes[j])
    }
    j=j+1
  }
  return alumnes2
}
/*
  Función que se encargara de obtener las calificaciones de la lista Alumno en una lista Double, ordenar la lista Double y llamar a la función pExtremos para retornar dos listas, la de alto promedio y la de bajo promedio.
  Ingresa
    alumnes: Lista de alumnos
  Devuelve
    [alumno]: Alumno con el promedio mas bajo
    [alumno]: Alumno con el promedio mas alto*/
func promedios(alumnes:[alumno])->([alumno],[alumno]){
  var i: Int=0
  let larg: Int=alumnes.count
  var temp: [Double]=[]
  while i<larg{
    temp.append(alumnes[i].p)
    i=i+1
  }
  let temp1=temp.sorted()
  return 
    (pExtremos(alumnes:alumnes,ext:temp1[0],larg:larg),
    pExtremos(alumnes:alumnes,ext:temp1[i-1],larg:larg))
}
/*
  Función que se encargara de verificar si el alumno es becario (true) o no (false)
  Ingresa
    alumnes: Lista de alumnos
  Devuelve
    [alumno]: Lista de alumnos con beca*/
func becarios(alumnes:[alumno])->[alumno]{
  var j: Int=0
  var alumnes2: [alumno]=[]
  let larg: Int=alumnes.count
  while j<larg{
    if true==alumnes[j].b{
      alumnes2.append(alumnes[j])
    }
    j=j+1
  }
  return alumnes2
}
/*Funcion principal del programa que llamara a las funciones correspondiente*/
func main(){
  var alumnes: [alumno]=[]
  alumnes=intome()
  print("Alumnos ingresados")
  printAll(alumnes:alumnes)
  print("Ordenando Alfabeticamente")
  alumnes=alfabetico(alumnes:alumnes)
  printAll(alumnes:alumnes)
  print("Alumno(s) con promedio alto")
  let (alumnesPBajo,alumnesPAlto)=promedios (alumnes:alumnes)
  printAll(alumnes:alumnesPAlto)
  print("Alumno(s) con promedio bajo")
  printAll(alumnes:alumnesPBajo)
  print("Alumno(s) con beca")
  let alumnesBeca=becarios(alumnes:alumnes)
  printAll(alumnes:alumnesBeca)
}
main()