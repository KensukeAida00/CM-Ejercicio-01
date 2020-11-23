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
//alumnes=intome()
alumnes.append(alumno(n:"Roberto",e:15,p:9.5,b:true))
alumnes.append(alumno(n:"Kenia",e:19,p:10.0,b:true))
alumnes.append(alumno(n:"Katia",e:24,p:7.5,b:false))
alumnes.append(alumno(n:"Andrea",e:22,p:10.0,b:true))
alumnes.append(alumno(n:"Gonzalo",e:24,p:6.0,b:false))
alumnes.append(alumno(n:"Diego",e:26,p:6.0,b:true))
alumnes.append(alumno(n:"Ricardo",e:21,p:8.9,b:false))
alumnes.append(alumno(n:"Sebastian",e:19,p:7.6,b:false))
alumnes.append(alumno(n:"Kevin",e:18,p:6.1,b:true))
alumnes.append(alumno(n:"Ernesto",e:24,p:7.4,b:false))
alumnes.append(alumno(n:"Sandra",e:22,p:6.6,b:true))
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