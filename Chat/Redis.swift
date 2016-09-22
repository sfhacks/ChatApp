import Foundation
import CocoaAsyncSocket

class Redis: NSObject,  GCDAsyncSocketDelegate {
    
    //Alloc GCDAsyncSocket
    var Socket: GCDAsyncSocket?
    let err: NSError? = nil
    
    /*============================================================
     // Server Open Connection
     ============================================================*/
    func server(endPoint: String, onPort: UInt16){
        
        //Check For Socket Condition
        if !(Socket != nil) {
            
            //Assign Delegeate to Self Queue
            Socket = GCDAsyncSocket(delegate: self, delegateQueue: DispatchQueue.main)
            
            
        }
        
        /*============================================================
         GCDAsyncSocket ConnectToHost Throw Error so you must handle
         this with Try [Try!], do, Catch.
         ============================================================*/
        
        do{
            //Assign Function Constants
            try Socket!.connect(toHost: endPoint, onPort: onPort)
        }catch {
            //Error
            print(err)
        }
        
        //Read Send Data
        Socket?.readData(withTimeout: 2, tag: 1)
    }
    
    
    //Server Confirmation
    func socket(_ sock: GCDAsyncSocket, didConnectToHost host: String, port: UInt16) {
        print("Connected to Redis!")
    }
    
    /*============================================================
     // Read Data From Redis Server [NSUTF8StringEncoding]
     ============================================================*/
    
    func socket(_ sock: GCDAsyncSocket, didRead data: Data, withTag tag: Int) {
        let Recieved: NSString = NSString(data: data as Data, encoding: String.Encoding.utf8.rawValue)!
        print(Recieved)
    }
    
    /*===============================================================
     // Send Command [I Will create Full SET and Upload it to Github]
     =================================================================*/
    
    func Command(Command: String){
        let request: String = Command + "\r\n"
        let data: NSData = request.data(using: String.Encoding.utf8)! as NSData
        Socket!.write(data as Data, withTimeout: 1.0, tag: 0)
        
    }
    
}
