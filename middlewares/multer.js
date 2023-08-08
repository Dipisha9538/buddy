const multer = require('multer')
// const maxSize = 5 * 1024 * 1024; //2MB
const uuid4 = require('uuid').v4
const path = require('path')

const storage = multer.diskStorage({
    destination: (req, file, cb) => {
        cb(null,path.join(__dirname,"../public/image"),function(err,success){
            if(err){
                throw err
            }

        }  )
    },
    filename: (req, file, cb)=> {
        const name = Date.now()+'-'+file.originalname;
        // let ext = path.extname(file.originalname)
        cb(null,name, function(err,success){
            if(err){throw err}

        })
    },
});

// const imageFileFilter = (req, file, cb) => {
//     if (!file.originalname.match(/\.(jpg|jpeg|png|gif)$/)) {
//       return cb(new Error("File format not supported."), false);
//     }
//     cb(null, true);
// };

const uploads = multer({
    storage: storage,
    // fileFilter: imageFileFilter,
    // limits: { fileSize: maxSize },
});

module.exports = uploads;