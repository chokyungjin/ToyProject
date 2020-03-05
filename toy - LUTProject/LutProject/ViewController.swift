
//
//  ViewController.swift
//  LutProject
//
//  Created by 조경진 on 2020/02/23.
//  Copyright © 2020 조경진. All rights reserved.
//

import UIKit
import ColorCube
import AssetsLibrary
import AVFoundation

class ViewController: UIViewController , UIImagePickerControllerDelegate, UINavigationControllerDelegate, AVCaptureVideoDataOutputSampleBufferDelegate{
    
    
    //MARK: IBOutlet..
    @IBOutlet weak var imageView: UIImageView!
    
    //MARK: Vars..

    var currentImage : UIImage!
    var currentFilter : CIFilter!
    var linkURL : URL!
    var imageName : String?
    var documentDir :String?
    var photoURL: URL!
    var localURL: URL!
    var beginImage: CIImage!
    let captureSession = AVCaptureSession()
    let backCamera = AVCaptureDevice.default(for: AVMediaType.video)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(importPicture))
        
        captureSession.sessionPreset = AVCaptureSession.Preset.photo
        
    }
    
    @objc func importPicture() {
        let picker = UIImagePickerController()
        picker.allowsEditing = true
        picker.delegate = self
        present(picker, animated: true)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let image = info[.editedImage] as? UIImage else {return}
        //beginImage로 가져올거얌
        
        beginImage = CIImage(image: info[UIImagePickerController.InfoKey.originalImage] as! UIImage)
        currentImage = image
        dismiss(animated: true)
        
        imageView.image = currentImage
        
   
    }
    
    @IBAction func changeFilter(_ sender: UIButton) {
        
        let ac = UIAlertController(title: "Choose Filter", message: nil, preferredStyle: .actionSheet)
        ac.addAction(UIAlertAction(title: "Test1", style: .default, handler: setFilter))
        ac.addAction(UIAlertAction(title: "Test2", style: .default, handler: setFilter))
        ac.addAction(UIAlertAction(title: "Test3", style: .default, handler: setFilter))
        ac.addAction(UIAlertAction(title: "Test4", style: .default, handler: setFilter))
        ac.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        
        if let popoverController = ac.popoverPresentationController{
            popoverController.sourceView = sender
            popoverController.sourceRect = sender.bounds
        }
        
        present(ac, animated: true)
        
    }
    
    func setFilter(action : UIAlertAction) {
        guard currentImage != nil else {return}
        guard let actionTitle = action.title else {return}
        print(actionTitle)
        
        //LUT3 와 지은이가 보내준 파일들(LUT5,6)이 적용이 안되는 문제
        let LUT = Bundle(for: ViewController.self).path(forResource: "LUT", ofType: "png")
        .flatMap { URL(fileURLWithPath: $0) }
        .flatMap { try? Data(contentsOf: $0) }
        .flatMap { UIImage(data: $0) }
        
        let LUT2 = Bundle(for: ViewController.self).path(forResource: "LUT2", ofType: "png")
        .flatMap { URL(fileURLWithPath: $0) }
        .flatMap { try? Data(contentsOf: $0) }
        .flatMap { UIImage(data: $0) }
        
        let LUT4 = Bundle(for: ViewController.self).path(forResource: "LUT4", ofType: "png")
            .flatMap { URL(fileURLWithPath: $0) }
            .flatMap { try? Data(contentsOf: $0) }
            .flatMap { UIImage(data: $0) }
        
        let hald6 = Bundle(for: ViewController.self).path(forResource: "hald6", ofType: "png")
        .flatMap { URL(fileURLWithPath: $0) }
        .flatMap { try? Data(contentsOf: $0) }
        .flatMap { UIImage(data: $0) }
        
        
        if actionTitle == "Test1" {
            let data = ColorCube.cubeData(lutImage: LUT!, dimension: 64, colorSpace: CGColorSpaceCreateDeviceRGB())
            
            let filter = CIFilter(name: "CIColorCube", parameters: [
                "inputCubeDimension":64,
                "inputCubeData": data
            ])
            filter?.setValue(beginImage, forKey: kCIInputImageKey)
            
            
            let context = CIContext(options: nil)
            
            if let currentFilter = filter {
                if let output = currentFilter.outputImage {
                    if let cgimg = context.createCGImage(output, from: output.extent) {
                        let processedImage = UIImage(cgImage: cgimg)
                        imageView.image = processedImage
                        //오른쪽으로 90도 회전
                        //imageView.transform = CGAffineTransform(rotationAngle: CGFloat( 90 * CGFloat.pi / 180))
                        // do something interesting with the processed image
                    }
                }
            }
        }
        else if actionTitle == "Test2" {
            let data = ColorCube.cubeData(lutImage: LUT2!, dimension: 64, colorSpace: CGColorSpaceCreateDeviceRGB())
            
            let filter = CIFilter(name: "CIColorCube", parameters: [
                "inputCubeDimension":64,
                "inputCubeData": data,
                "inputImage":beginImage
            ])
            
           
            let context = CIContext(options: nil)
            
            if let currentFilter = filter {
                if let output = currentFilter.outputImage {
                    if let cgimg = context.createCGImage(output, from: output.extent) {
                        let processedImage = UIImage(cgImage: cgimg)
                        imageView.image = processedImage
                        //오른쪽으로 90도 회전
                        // imageView.transform = CGAffineTransform(rotationAngle: CGFloat( 90 * CGFloat.pi / 180))
                        // do something interesting with the processed image
                    }
                }
            }
        }
        
        else if actionTitle == "Test3" {
            let data = ColorCube.cubeData(lutImage: LUT4!, dimension: 64, colorSpace: CGColorSpaceCreateDeviceRGB())
            
            let filter = CIFilter(name: "CIColorCube", parameters: [
                "inputCubeDimension":64,
                "inputCubeData": data,
                "inputImage":beginImage
            ])
            
           
            let context = CIContext(options: nil)
            
            if let currentFilter = filter {
                if let output = currentFilter.outputImage {
                    if let cgimg = context.createCGImage(output, from: output.extent) {
                        let processedImage = UIImage(cgImage: cgimg)
                        imageView.image = processedImage
                        //오른쪽으로 90도 회전
                        // imageView.transform = CGAffineTransform(rotationAngle: CGFloat( 90 * CGFloat.pi / 180))
                        // do something interesting with the processed image
                    }
                }
            }
        }
        
        else if actionTitle == "Test4" {
            let data = ColorCube.cubeData(lutImage: hald6!, dimension: 64, colorSpace: CGColorSpaceCreateDeviceRGB())
            
            let filter = CIFilter(name: "CIColorCube", parameters: [
                "inputCubeDimension":64,
                "inputCubeData": data,
                "inputImage":beginImage
            ])
            
           
            let context = CIContext(options: nil)
            
            if let currentFilter = filter {
                if let output = currentFilter.outputImage {
                    if let cgimg = context.createCGImage(output, from: output.extent) {
                        let processedImage = UIImage(cgImage: cgimg)
                        imageView.image = processedImage
                        //오른쪽으로 90도 회전
                        // imageView.transform = CGAffineTransform(rotationAngle: CGFloat( 90 * CGFloat.pi / 180))
                        // do something interesting with the processed image
                    }
                }
            }
        }
        
        
        
    }
    
    
}

