//
//  VideoViewController.swift
//  SingleViewAppVideo
//
//  Created by Muhammed Siddiqui on 2024-09-08.
//
//MARK: FRAMEWORKS
import UIKit
import AVFoundation


//MARK: SUPERCLASS
class VideoViewController: UIViewController {
    
    //MARK: OUTLETS
    @IBOutlet weak var Play: UIBarButtonItem!
    @IBOutlet weak var Pause: UIBarButtonItem!
    @IBOutlet weak var Rewind: UIBarButtonItem!
    @IBOutlet weak var Stop: UIBarButtonItem!
    @IBOutlet weak var Forward: UIBarButtonItem!
    @IBOutlet weak var PlaybackProgress: UISlider!
    @IBOutlet weak var CurrentTime: UILabel!
    @IBOutlet weak var EstimatedTime: UILabel!
    
    //MARK: VARIABLES
    var avPlayer: AVPlayer?
    var playerLayer: AVPlayerLayer?
    var timer: Timer?
    var paused: Bool = false
    
    //MARK: OVERRIDE PROPERTY
    override func viewDidLoad() {
        super.viewDidLoad()
        setupVideoPlayer()
    }
    
    
    //MARK: func VideoPlayer
    func setupVideoPlayer(){
        guard let path = Bundle.main.url(forResource: "BirdChirping", withExtension: "mp4") else{
            print("Not able to find path")
            return
        }
            avPlayer = AVPlayer(url: path)
            playerLayer = AVPlayerLayer(player: avPlayer)
            playerLayer?.frame = view.bounds// view total bounds
            playerLayer?.videoGravity = .resizeAspect// this code is for the aspect of the screen.
            if let playerLayer =  playerLayer { // adding the layerinside vioew it is used small drawing or render
                view.layer.insertSublayer(playerLayer, at: 0)
            
        }
        //MARK: SLIDER MATCH VALUE
        if let duration =  avPlayer?.currentItem?.asset.duration { // this is where I am getting duration value of video where i get from assesst always cmtime
            PlaybackProgress.maximumValue = Float(CMTimeGetSeconds(duration))// first conver to seconds cmtime and then float
           updateDurationLabel(duration: duration)// I need to understand what part this is playing
        }
        
         let tapGetsure = UITapGestureRecognizer(target: self, action: #selector(forwardTapped))// because this initializer their is no optional binding need it only nned it when you dont know which the variable i am using is going to have value inside or not.
            tapGetsure.numberOfTapsRequired =  1
            view.addGestureRecognizer(tapGetsure)
        
    }
    //MARK: ON SCREENTAPPED FORWARD
    @objc func forwardTapped(_ sender: UITapGestureRecognizer){
         let touchScreen = sender.location(in: self.view)// touchscreen when user click on screen in view
        if touchScreen.x > view.frame.size.width / 2 { //   half of the screen  number if it is greater than it will forward
            forward(nil)
        }else if touchScreen.x < view.frame.size.width / 2 {// half of the screen if the less  than of the half screen number
            Rewind(nil)
        }
    }
    //MARK: UPDATE DURATION LABEL
    func updateDurationLabel(duration: CMTime){ // Duration CMTime always audio and video precise time we can use
        let seconds = CMTimeGetSeconds(duration)
        EstimatedTime.text = formatTime(time: seconds)// where we store in seconds
    }
    
    //MARK: FORMATTIME
    func formatTime(time: TimeInterval) -> String { // minutes and seconds and dates all in timeinterval, in our case we using to store seconds in for general purpose span time.
        let minutes = Int(time) / 60 // formula of minutes
        let seconds = Int(time) % 60 // formula of seconds
        return String(format: "%02d:%02d", minutes, seconds) // this is the dispplay of time format
    }
    
    //MARK: START TIMER
    func startTimer(){
        timer =  Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateLabels), userInfo: nil, repeats: true)
    }
    
    //MARK: STOP TIMER
    func stopTimer(){
        timer?.invalidate()
        timer =  nil
    }
    
    //MARK: PLAY FUNC
    @IBAction func Play(_ sender: UIBarButtonItem) {
        avPlayer?.play()
        startTimer()
    }
    
    //MARK: PAUSE FUNC
    @IBAction func Pause(_ sender: UIBarButtonItem) {
        avPlayer?.pause()
        stopTimer()
        paused = true
    }
    
    //MARK: REWIND FUNC
    @IBAction func Rewind(_ sender: UIBarButtonItem?) {
        guard let currentTime = avPlayer?.currentTime() else {
            return
        }
        let newTime = CMTimeSubtract(currentTime, CMTimeMakeWithSeconds(10, preferredTimescale: currentTime.timescale))// this subtracting the video time updated accordingly.
        avPlayer?.seek(to: newTime)
        updateLabels()
    }
    
    //MARK: STOP FUNC
    @IBAction func Stop(_ sender: UIBarButtonItem) {
        avPlayer?.pause()
        avPlayer?.seek(to: CMTime.zero)
        stopTimer()
        updateLabels()
    }
    
    //MARK: FORWARD FUNC
    @IBAction func forward(_ sender: UIBarButtonItem?) {
        guard let currentTime = avPlayer?.currentTime()else {
            return
        }
        let newTime =  CMTimeAdd(currentTime, CMTimeMakeWithSeconds(10, preferredTimescale: currentTime.timescale))
        avPlayer?.seek(to: newTime)
        updateLabels()
    }
        
    //MARK: PLAYBACK FUNC
    @IBAction func playBack(_ sender: UISlider) {// I dont understand this func
        let newTime = CMTimeMakeWithSeconds(Float64(sender.value), preferredTimescale: 600)// cit is for slider to get actual frame of video the 600 is standard.
        avPlayer?.seek(to: newTime)
        updateLabels()
        
    }
    //MARK: UPDATE CURRENT LABEL
    @objc func updateLabels() {
       if let currentTime = avPlayer?.currentTime() {
            PlaybackProgress.value = Float(CMTimeGetSeconds(currentTime))
           CurrentTime.text = formatTime(time: CMTimeGetSeconds(currentTime))
        }
    }
    
}
