const gulp = require('gulp');
var bump = require('gulp-bump');

gulp.task('up-develop',  async function () {
    return gulp.src(['./package.json'])
        .pipe(bump({type:'prerelease'}))
        .pipe(gulp.dest('./'))
})

gulp.task('up-patch', function () {
    return gulp.src(['./package.json'])
        .pipe(bump({type:'patch'}))
        .pipe(gulp.dest('./'))
})

gulp.task('up-minor', function () {
    return gulp.src(['./package.json'])
        .pipe(bump({type:'minor'}))
        .pipe(gulp.dest('./'))
})


gulp.task('up-major', function () {
    return gulp.src(['./package.json'])
        .pipe(bump({type:'major'}))
        .pipe(gulp.dest('./'))
})