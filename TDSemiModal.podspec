Pod::Spec.new do |s|
  s.name         = "TDSemiModal"
  s.version      = "1.0.0"
  s.summary      = "Semi-modal view & DatePicker for IOS"
  s.homepage     = "https://github.com/reednj/TDSemiModal"
  s.author       = { "Nathan Reed" => "",
                     "Victor Berga => ""}
  
  s.platform            = :ios, '6.1'
  s.requires_arc        = true
  s.source              = { :git => "https://github.com/reednj/TDSemiModal.git", :tag => s.version.to_s }
  s.source_files        = 'Classes/*.{h,m}'
  s.public_header_files = 'Classes/*.h'
  s.resources           = 'Classess/*.xib'
  s.frameworks          = 'UIKit'
end


