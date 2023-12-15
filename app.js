const express = require('express');
const multer = require('multer');
const { spawn } = require('child_process');
const path = require('path');
const fs = require('fs');

const htmlPath = path.join(__dirname, 'index.html');
const htmlContent = fs.readFileSync(htmlPath, 'utf8');
const app = express();
const port = 3000;

const storage = multer.diskStorage({
	destination: '/home/shames2470/SCA/SCA/user/source-code',
	filename: (req, file, cb) => {
	  cb(null, file.originalname);
	},
});

app.get('/', (req, res) => {
    res.sendFile(path.join(__dirname, 'index.html'));
});

const upload = multer({ storage: storage });
app.use(express.static(__dirname, { 'extensions': ['html', 'css']}));

app.post('/upload', upload.single('fileInput'), (req, res) => {
     res.send({ message: 'File uploaded successfully!' });
});


app.use('/output', express.static('/home/shames2470/SCA/SCA/user/output/helloNew.html'));
app.get('/openfile', (req, res) => {
	const fileName = 'helloNew.html';
	const filePath = path.join(__dirname, 'output', fileName);
	res.sendFile(filepath, (err) => {
		if (err) {
			console.error('Error sending file:', err);
			res.status(err.status).end();
		} else {
			console.log('File ${fileName} sent successfully.');
		}
	});
});


app.post('/run-sca', (req, res) => {
	const child = spawn('/home/shames2470/SCA/SCA/core/src/a.out', [], { shell: true});
	
	let output = '';

	child.std.on('data', (data) => {
		output += data.toString();
	});

	child.stderr.on('data', (data) => {
		console.error('Error: ${data}');
	});

	child.on('close', (code) => {
		if (code === 0) {
			res.status(200).send('Command done!');
		} else {
			res.status(500).send('Command failed.');
		}
	});
});	

app.listen(port, () => {
    console.log(`Server running at http://localhost:${port}`);
});
