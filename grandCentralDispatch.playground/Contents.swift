import UIKit

var greeting = "Hello, playground"
func syncWork(){
    let northZone = DispatchQueue(label: "Perform task with Team North")
    let southZone = DispatchQueue(label: "Perform task with Team South")

    southZone.async {
        for number in 1...3{
            print("South \(number)")
        }
    }


    northZone.sync {
        for number in 1...3{
            print("North \(number)")
        }
    }
}
// call func
syncWork()
 let queue = DispatchQueue(label: "Serial queue")
let group = DispatchGroup()
group.enter()
queue.async {
    sleep(1)
    print("Task 1 is Done")
    group.leave()
}
group.enter()
queue.async {
    sleep(2)
    print("Task 2 is Done")
    group.leave()
}
group.notify(queue: queue){
    print("All Tasks are Done")
}

print("Continue execution immediately")
// .concurrent==== have no idea that which one task completed work first

let queue2 = DispatchQueue(label: "Quality of Services")
queue2.async(qos: .background){
    print("this is a background task and Used for tasks like saving data in the local database or any maintenance code which is not on high priority.")
}
queue2.async(qos: .userInitiated){
    print("Used for tasks like loading data from API, preventing the user from making interactions.it is also for fast response but it will not be freeze our app or neither crash ,. Like load pdfs it will immediately show result to us., all ui task are we keep in main thread of dispatch queue")
}

