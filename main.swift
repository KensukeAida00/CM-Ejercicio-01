struct alumno{
	var n: String
	var e: Int
  var p: Double
  var b: Bool
}
func conAlumno(i:Int)->(String,Int,Double,Bool){
  print("Introduce el alumno",i)
  print("Introduce el nombre")
  let n=readLine()!
  print("Introduce la edad")
  let e=readLine()!
  print("Introduce el promedio")
  let p=readLine()!
  print("¿Tiene beca? [si=y/no=otro]")
  var b=false
  if let d=readLine(){
    if d == "y"{
      b=true}
    }
  return (n,Int(e)!,Double(p)!,b)
}
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
func promedios(alumnes:[alumno])->([alumno],[alumno]){
  var i: Int=0
  let larg: Int=alumnes.count
  var temp: [Double]=[]
  while i<larg{
    temp.append(alumnes[i].p)
    i=i+1
  }
  let temp1=temp.sorted()
  return (pExtremos(alumnes:alumnes,ext:temp1[0],larg:larg),
          pExtremos(alumnes:alumnes,ext:temp1[i-1],larg:larg))
}
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
var alumnes: [alumno]=[]
alumnes=intome()
print("Alumnos ingresados")
printAll(alumnes:alumnes)
print("Ordenando Alfabeticamente")
alumnes=alfabetico(alumnes:alumnes)
printAll(alumnes:alumnes)
print("Alumno(s) con promedio alto")
let (alumnesPBajo,alumnesPAlto)=promedios(alumnes:alumnes)
printAll(alumnes:alumnesPAlto)
print("Alumno(s) con promedio bajo")
printAll(alumnes:alumnesPBajo)
print("Alumno(s) con beca")
let alumnesBeca=becarios(alumnes:alumnes)
printAll(alumnes:alumnesBeca)