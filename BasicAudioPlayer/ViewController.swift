//
//  ViewController.swift
//  BasicAudioPlayer
//
//  Created by Muhammed Siddiqui on 2024-09-02.
//
//MARK: FRAMEWORKS
import UIKit
import AVFoundation

//MARK: SUPERCLASS
class ViewController: UIViewController {
    
    //MARK: OUTLETS
    @IBOutlet weak var playBtn: UIBarButtonItem!
    @IBOutlet weak var pauseBtn: UIBarButtonItem!
    @IBOutlet weak var stopBtn: UIBarButtonItem!
    @IBOutlet weak var forwardBtn: UIBarButtonItem!
    @IBOutlet weak var backwardBtn: UIBarButtonItem!
    @IBOutlet weak var timeElapsed: UILabel!
    @IBOutlet weak var timeStarted: UILabel!
    @IBOutlet weak var sliderPlayer: UISlider!
    @IBOutlet weak var volume: UISlider!
    
    //MARK: VARIABLES
    var soundPlayer: AVAudioPlayer = AVAudioPlayer()
    var timer: Timer?
    var paused: Bool =  false
    var soundList: [String] = ["YellowFlickerBeat","Katniss","KatnissIsChosen","Atlas"]

    
    //MARK: OVERRIDE PROPERTY
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupPrepare()
    }
    
    func setupPrepare(){
        let randomNumber = Int(arc4random_uniform(UInt32(soundList.count)))// pick the random song whenever user clicked on the play button
        let selectedSong = soundList[randomNumber]
            guard let path =  Bundle.main.path(forResource: selectedSong, ofType: "mp3")
            else {
                print("could not found")
                return
            }
            let url = URL(fileURLWithPath: path)
            do {
                soundPlayer = try AVAudioPlayer(contentsOf: url)
                soundPlayer.prepareToPlay()
            } catch {
                print("Could not able to play")
            }
    }
    
    //MARK: PLAY ACTION
    @IBAction func playAction(_ sender: UIBarButtonItem) {
        setupPrepare()// why we need to call here. i know little bit
        sliderPlayer.value = 0.0
        sliderPlayer.maximumValue = Float(soundPlayer.duration)
        soundPlayer.play()
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(playerSlider(_:)), userInfo: nil, repeats: true)// this is for timer where slider can update after every seconds if you want to perform any task periodically.
    }
    
    //MARK: FORMATTIME
    func formatTime(time: TimeInterval) -> String{
        let minutes = Int(time) / 60// formula of minutes.
        let seconds = Int(time) % 60// formula of seconds
        return String(format: "%02d:%02d", minutes, seconds)// how to display time of the song in what format in basically time format
    }
    
    //MARK: PAUSE ACTION
    @IBAction func pauseAction(_ sender: UIBarButtonItem) {
            soundPlayer.pause()
            paused = true
    }
    
    //MARK: STOP ACTION
    @IBAction func stopAction(_ sender: UIBarButtonItem) {
        if soundPlayer.isPlaying || paused{
            soundPlayer.currentTime = 0
            soundPlayer.stop()
            timer?.invalidate()
        }
    }
    
    //MARK: FORWARD ACTION
    @IBAction func forwardAction(_ sender: UIBarButtonItem) {
        soundPlayer.currentTime += 10
    }
    
    //MARK: BACKWARD ACTION
    @IBAction func backwardAction(_ sender: UIBarButtonItem) {
        soundPlayer.currentTime -= 10
    }
    
    //MARK: SLIDER ACTION
    @IBAction func playerSlider(_ sender: UISlider) {
        if soundPlayer.isPlaying || paused{
            sliderPlayer.value = Float(soundPlayer.currentTime)
            timeElapsed.text = formatTime(time: soundPlayer.duration - soundPlayer.currentTime)
            timeStarted.text = formatTime(time: soundPlayer.currentTime)
        }else{
            sliderPlayer.value = 0.0
        }
    }
    
    //MARK: VOLUME
    @IBAction func volumeControl(_ sender: UISlider) {
        soundPlayer.volume = volume.value
    }
    
}

