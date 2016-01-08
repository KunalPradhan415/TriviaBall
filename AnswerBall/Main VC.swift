//
//  Main VC.swift
//  AnswerBall
//
//  Created by Kunal Pradhan on 12/18/15.
//  Copyright © 2015 KP. All rights reserved.
//

import UIKit
import AVFoundation

class Main_VC: UIViewController, AVAudioPlayerDelegate {

    @IBOutlet weak var label: UILabel!
    
    var audioPlayer = AVAudioPlayer();
    
    var answers = [
        "Ben & Jerry originally considered getting into the bagel business, but equipment was too expensive!",
        "The first webcam watched a coffee pot.",
        "On Good Friday in 1930, the BBC reported, \("There is no news") Instead, they played piano music.",
        "The 3 Musketeers bar was originally split into three pieces with three different flavors: vanilla, chocolate and strawberry. When the other flavors became harder to come by during World War II, Mars decided to go all chocolate",
        "Fredric Baur invented the Pringles can. When he passed away in 2008, his ashes were buried in one.",
        "In the 1980s, Pablo Escobar's Medellin Cartel was spending $2,500 a month on rubber bands just to hold all their cash.",
        "When he appeared on Wait Wait...Don't Tell Me!, Bill Clinton correctly answered three questions about My Little Pony: Friendship Is Magic",
        "Johnny Cash's A \("Boy Named Sue") was penned by beloved children's author Shel Silverstein",
        "When the mummy of Ramses II was sent to France in the mid-1970s, it was issued a passport. Ramses' occupation? \("King (deceased)").",
        "In 1939, Hitler's nephew wrote an article called \("Why I Hate My Uncle.") He came to the U.S., served in the Navy, and settled on Long Island.",
        "Alaska is the only state that can be typed on one row of keys.",
        "Male students at Brigham Young University need a doctor's note to grow a beard.",
        "In 1991, Wayne Allwine, the voice of Mickey Mouse, married Russi Taylor—the voice of Minnie.",
        "Obsessive nose picking is called Rhinotillexomania",
        "Editor Bennett Cerf challenged Dr. Seuss to write a book using no more than 50 different words. The result? Green Eggs and Ham.",
        "The only number whose letters are in alphabetical order is 40 (f-o-r-t-y)",
        "At the 1905 wedding of Franklin and Eleanor Roosevelt, President Teddy Roosevelt gave away the bride.",
        "There really was a Captain Morgan. He was a Welsh pirate who later became the lieutenant governor of Jamaica.",
        "Bear Bryant was once asked to contribute $10 to help pay for a sportswriter's funeral. According to legend, he said, \("Here's a twenty, bury two.")",
        " Kool-Aid was originally marketed as \("Fruit Smack.")?",
        "At Fatburger, you can order a \("Hypocrite")—a veggie burger topped with crispy strips of bacon..",
        "Reno is farther west than Los Angeles.",
        "Movie theater popcorn costs, on average, more per ounce than filet mignon.",
        "At the wife-carrying championship in Finland,  the award for first prize is the wife's weight in beer.",
        "In 1894, a young Adolf Hitler almost drowned but was saved by a priest at the last second",
        "Can I get a translation please?",
        "I'm gonna guess... NO!",
        "I'm gonna guess... YES!",
        "It would seem so.",
        "Samuel L. Jackson used to be a cheerleader.",
        "When flipped upside-down, sharks enter a state of tonic immobility, rendering them unable to move for 15 minutes.",
        "I need a new profession!",
        "There is more money printed for Monopoly each year than there is real money around the world. The amount of money in a Monopoly game is $15,140.",
        "The very first zombie movie ever made is the 1932 American film White Zombie. It was also the first horror movie that was not a silent film, as well as the first independent horror film to star Bela Lugosi, an icon of horror cinema.",
        "In Swaziland, the chance of a 15-year-old boy living to 50 years is 28%. For a girl it is just 22%. Before AIDS, it was 92% and 97%, respectively.",
        "In 1955, the assistant secretary of defense suggested that citizens tattoo their blood type on their arms in case there was an attack against the U.S.",
        "The only president to be unanimously elected was George Washington (1732-1799). He also refused to accept his presidential salary, which was $25,000 a year.",
        "If you leave a jellyfish in the sun for too long, it will evaporate",
        "China owns every panda in the world",
        "In 1999, Furbies were banned from the National Security Agency's Maryland headquarters because it was feared the toys might repeat national security secrets."
    ];
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        label.text = "Ask a Question!";
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func getAnswerTapped(sender: AnyObject) {
        //Get a random number
        let random = Int(arc4random_uniform(UInt32(answers.count)));
        //Display the answer
        
        label.text = answers[random];
        
        //Play the sound
        do
        {
            try playSound("shakesound", fileExtension: "wav")
        }
        catch
        {
            return
        }
    }
    
    
    override func motionBegan(motion: UIEventSubtype, withEvent event: UIEvent?) {
        getAnswerTapped(self)
    }
    
    
    // This is the sound function used in AnswerBall (errors will resolve themselves within the app context).
    
    func playSound(fileName: String, fileExtension: String) throws {

        
        let dispatchQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)
        
        dispatch_async(dispatchQueue, { let mainBundle = NSBundle.mainBundle()
            
            let filePath = mainBundle.pathForResource("\(fileName)", ofType:"\(fileExtension)")
            
            if let path = filePath{
                let fileData = NSData(contentsOfFile: path)
                
                do {
                    /* Start the audio player */
                    self.audioPlayer = try AVAudioPlayer(data: fileData!)
                    
                    guard let player : AVAudioPlayer? = self.audioPlayer else {
                        return
                    }
                    
                    /* Set the delegate and start playing */
                    player!.delegate = self
                    if player!.prepareToPlay() && player!.play() {
                        /* Successfully started playing */
                    } else {
                        /* Failed to play */
                    }
                    
                } catch {
                    //self.audioPlayer = nil
                    return
                }
                
            }
            
        })
        
    }



}
