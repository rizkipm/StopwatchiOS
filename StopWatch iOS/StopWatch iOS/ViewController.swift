//
//  ViewController.swift
//  StopWatch iOS
//
//  Created by Rizki Syaputra on 10/10/17.
//  Copyright © 2017 Rizki Syaputra. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //deklarasi variable counter 
    var counter = 0.0
    //deklarasi timer
    var timer = Timer()
    //deklarasi isPlaying 
    var isPlaying = false

    @IBOutlet weak var labelPause: UIButton!
    @IBOutlet weak var labelStop: UIButton!
    @IBOutlet weak var labelStart: UIButton!
    @IBOutlet weak var labelTimer: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //menambilkan teks ke labelTimer
        labelTimer.text = String(counter)
        //agar button pause tidak aktif
        labelPause.isEnabled = false
    }
    
    @IBAction func btnStart(_ sender: Any) {
        //mengecek apakah sedang playing atau tidak
        if(isPlaying){
            return
        }
        
        //button start tidak aktif
        labelStart.isEnabled = false
        //button pause aktif
        labelPause.isEnabled = true
        
        //mengatur timer sebagai scheduledTimer dengan interval 0.1 dan memanggil updateTimer
         timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(UpdateTimer), userInfo: nil, repeats: true)
        
        //mengatur isplaying nya true
        isPlaying = true
        
    }
    
    func UpdateTimer() {
        //mengatur counter nya di tambah 0.1
        //        counter = counter + 0.1
        //        //menampilkan ke label timer
        //        //%.1f ini adalah format untuk bilangan berkoma atau float
        //        //%.1d ini adalah fotmat untuk bilangan ril atau tidak berkoma
        //        labelTimer.text = String(format: "%.1f", counter)
        counter = counter + 0.1
        labelTimer.text = String(format: "%.1f", counter)
    }
    
    
    @IBAction func btnPause(_ sender: Any) {
        //agar button start aktif
        labelStart.isEnabled = true
        //agar button pause tidak aktif
        labelPause.isEnabled = false
        
        //menampilkan data yang valid
        timer.invalidate()
        
        //mengatur isPlaying false
        isPlaying = false
    }
    
    @IBAction func btnStop(_ sender: Any) {
        //agar button start aktif
        labelStart.isEnabled = true
        //agar button pause tidak aktif
        labelPause.isEnabled = false
        
        //menampilkan data yang valid
        timer.invalidate()
        
        //mengatur isPlaying false
        isPlaying = false
        
        //mengatur counter nya menjadi 0 kembali
        counter = 0.0
        //menampilkan timer ke label
        //fungsi dari String(counter) adalah mengubah nilai desimal counter ke dalam bentuk string
        labelTimer.text = String(counter)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

